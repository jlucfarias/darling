#import <UIFoundation/UINibDecoder.h>
#import <Foundation/NSMethodSignature.h>
#import <Foundation/NSInvocation.h>

/* Header constants */
NSString *const CONSTANT_HEADER = @"NIBArchive";
const uint32_t FORMAT_VERSION   = 1;
const uint32_t CODER_VERSION    = 10;

/* Offset constants */
const NSUInteger FORMAT_VERSION_POSITION = 10;
const NSUInteger CODER_VERSION_POSITION  = 14;
const NSUInteger OBJECT_COUNT_POSITION   = 18;
const NSUInteger OBJECT_OFFSET_POSITION  = 22;
const NSUInteger KEY_COUNT_POSITION      = 26;
const NSUInteger KEY_OFFSET_POSITION     = 30;
const NSUInteger VALUE_COUNT_POSITION    = 34;
const NSUInteger VALUE_OFFSET_POSITION   = 38;
const NSUInteger CLASS_COUNT_POSITION    = 42;
const NSUInteger CLASS_OFFSET_POSITION   = 46;

@implementation UINibDecoder

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    return [NSMethodSignature signatureWithObjCTypes: "v@:"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSLog(@"Stub called: %@ in %@", NSStringFromSelector([anInvocation selector]), [self class]);
}

- (instancetype)init
{
    self = [super init];

    if (!self) {
        return nil;
    }

    _bytes = nil;
    _length = 0;
    _nameClassMapper = [[NSMutableDictionary alloc] init];
    _delegate = nil;

    return self;
}

- (instancetype)initForReadingWithData:(NSData *)data
{
    if (data == nil)
    {
        [self release];

        return nil;
    }

    self = [self init];

    if (!self) {
        return nil;
    }

    _bytes = data.bytes;
    _length = data.length;

    uint64_t (^readVarIntAt)(NSUInteger *) = ^(NSUInteger *)offsetPtr
    {
        uint64_t result = 0;
        int shift = 0;

        while (true) {
            uint8_t byte = _bytes[(*offsetPtr)++];
            result |= ((uint64_t)(byte & 0x7F)) << shift;

            if (byte & 0x80) {
                break;
            }

            shift += 7;
        }

        return result;
    };

    /* Parse header */
    _header.magic = (char *) [[data subdataWithRange:NSMakeRange(0, 10)] bytes];
    _header.formatVersion = OSReadLittleInt32(_bytes, FORMAT_VERSION_POSITION);
    _header.coderVersion = OSReadLittleInt32(_bytes, CODER_VERSION_POSITION);

    if (
        _length < 32
        || [[NSString stringWithUTF8String:_header.magic] compare:CONSTANT_HEADER] != NSOrderedSame
        || _header.formatVersion != FORMAT_VERSION
        || _header.coderVersion != CODER_VERSION
    ) {
        // TODO: Throw an exception if data is not a valid archive as NSKeyedUnarchive

        NSLog(@"Invalid NIBArchive file! header:%@, format:%u, coder:%u", _header.magic, _header.formatVersion, _header.coderVersion);

        return nil;
    }

    _header.keyCount = OSReadLittleInt32(_bytes, KEY_COUNT_POSITION);
    _header.keyOffset = OSReadLittleInt32(_bytes, KEY_OFFSET_POSITION);
    _keys = (UINibKey *)malloc(_header.keyCount * sizeof(struct UINibKey));
    void (^parseKeys)(void) = ^{
        uint32_t offset = _header.keyOffset;

        for (uint32_t i = 0; i < _header.keyCount; i++) {
            struct UINibKey key;
            key.length = readVarIntAt(&offset);
            key.name = (char *)[[data subdataWithRange:NSMakeRange(offset, key.length)] bytes];
            _keys[i] = key;
            offset += key.length;
        }
    };

    parseKeys();

    _header.classNameCount = OSReadLittleInt32(_bytes, CLASS_COUNT_POSITION);
    _header.classNameOffset = OSReadLittleInt32(_bytes, CLASS_OFFSET_POSITION);
    _classNames = (UINibClassName *)malloc(_header.classNameCount * sizeof(struct UINibClassName));
    void (^parseClassNames)(void) = ^{
        uint32_t offset = _header.classNameOffset;

        for (uint32_t i = 0; i < _header.classNameCount; i++) {
            struct UINibClassName className;
            className.length = readVarIntAt(&offset);
            className.fallbackClasses = readVarIntAt(&offset); // Ignored at this moment
            className.name = (char *)[[data subdataWithRange:NSMakeRange(offset, className.length)] bytes];
            _classNames[i] = className;
            offset += className.length;
        }
    };

    parseClassNames();

    _header.valueCount =   OSReadLittleInt32(_bytes, VALUE_COUNT_POSITION);
    _header.valueOffset =  OSReadLittleInt32(_bytes, VALUE_OFFSET_POSITION);
    _values = malloc(_header.valueCount * sizeof(struct UINibValue));
    void (^parseValues)(void) = ^{
        uint32_t offset = _header.valueOffset;

        for (uint32_t i = 0; i < _header.valueCount; i++) {
            struct UINibValue value;
            value.keyIndex = readVarIntAt(&offset);
            value.type = _bytes[offset++];
            value.bytes = nil;
            value.length = 0;

            switch (value.type) {
                case NibValueInt8: {
                    uint8_t v = _bytes[offset];
                    value.bytes = (uint8_t *)&v;
                    offset++;
                    break;
                }
                case NibValueInt16: {
                    uint16_t v = _bytes[offset];
                    value.bytes = (uint8_t *)&v;
                    offset += 2;
                    break;
                }
                case NibValueInt32: {
                    uint32_t v = OSReadLittleInt32(_bytes, offset);
                    value.bytes = (uint8_t *)&v;
                    offset += 4;
                    break;
                }
                case NibValueInt64: {
                    uint64_t v = OSReadLittleInt64(_bytes, offset);
                    value.bytes = (uint8_t *)&v;
                    offset += 8;
                    break;
                }
                case NibValueBoolTrue:
                case NibValueBoolFalse:
                case NibValueNil:
                    break;
                case NibValueFloat32: {
                    float f = _bytes[offset];
                    value.bytes = (uint8_t *)&f;
                    offset += 4;
                    break;
                }
                case NibValueFloat64: {
                    double d = _bytes[offset];
                    value.bytes = (uint8_t *)&d;
                    offset += 8;
                    break;
                }
                case NibValueData: {
                    value.length = readVarIntAt(&offset);
                    value.bytes = (uint8_t *)[[NSData dataWithBytes:&_bytes[offset] length:value.length] bytes];
                    offset += value.length;
                    break;
                }
                case NibValueRef: {
                    uint32_t v = OSReadLittleInt32(_bytes, offset);
                    value.bytes = (uint8_t *)&v;
                    offset += 4;
                    break;
                }
                default:
                    NSLog(@"[UINibDecoder] Unknown type: %d", value.type);
                    break;
            }

            _values[i] = value;
        }
    };

    parseValues();

    _header.objectCount =  OSReadLittleInt32(_bytes, OBJECT_COUNT_POSITION);
    _header.objectOffset = OSReadLittleInt32(_bytes, OBJECT_OFFSET_POSITION);
    _objects = malloc(_header.objectCount * sizeof(struct UINibObject));
    void (^parseObjects)(void) = ^{
        uint32_t offset = _header.objectOffset;

        for (uint32_t i = 0; i < _header.objectCount; i++) {
            struct UINibObject object;
            object.classIndex = readVarIntAt(&offset);
            object.valueStart = readVarIntAt(&offset);
            object.valueCount = readVarIntAt(&offset);
            _objects[i] = object;
            offset += className.length;
        }
    };

    parseObjects();

    return self;
}

- (instancetype)initForReadingWithData:(NSData *)data error:(NSError **)error
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return [self initForReadingWithData:data];
}

- (void)dealloc
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    [super dealloc];
}

- (NSUInteger)systemVersion
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return 0;
}

- (BOOL)allowsKeyedCoding
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return FALSE;
}

- (NSInteger)versionForClassName:(NSString *)className
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return nil;
}

- (BOOL)containsValueForKey:(NSString *)key
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return FALSE;
}

- (void)finishDecoding
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);
}

- (int)decodeIntForKey:(NSString *)key
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return 0;
}

- (int32_t)decodeInt32ForKey:(NSString *)key
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return (int32_t)0;
}

- (int64_t)decodeInt64ForKey:(NSString *)key
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return (int64_t)0;
}

- (float)decodeFloatForKey:(NSString *)key
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return (float)0.0;
}

- (void)decodeArrayOfFloats:(float *)items count:(NSUInteger)count forKey:(NSString *)key
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

}

- (double)decodeDoubleForKey:(NSString *)key
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return (double)0.0;
}

- (void)decodeArrayOfDoubles:(double *)items count:(NSUInteger)count forKey:(NSString *)key
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

}

- (NSInteger)decodeIntegerForKey:(NSString *)key
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return nil;
}

- (BOOL)decodeBoolForKey:(NSString *)key
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return FALSE;
}

- (id)decodeObjectForKey:(NSString *)key
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return nil;
}

- (void)decodeValuesOfObjCTypes:(const char *)types
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

}

- (const uint8_t *)decodeBytesForKey:(NSString *)key returnedLength:(NSUInteger *)length
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return nil;
}

- (void)decodeValueOfObjCType:(const char *)type at:(void *)data
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

}

- (NSData *)decodeDataObject
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return nil;
}

- (void)decodeArrayOfObjCType:(const char *)itemType count:(NSUInteger)count at:(void *)array
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

}

- (void *)decodeBytesWithReturnedLength:(NSUInteger *)length
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

}

- (id)decodePropertyListForKey:(NSString *)key
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return nil;
}

- (id)decodeNSObject
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return nil;
}

- (id)decodeCGPointForKey:(NSString *)key
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return nil;
}

- (id)decodeCGSizeForKey:(NSString *)key
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return nil;
}

- (id)decodeCFRectForKey:(NSString *)key
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return nil;
}

- (id)decodeArrayOfCGFloat
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return nil;
}

- (id)decodeCFAffineTransformForKey:(NSString *)key
{
    printf("STUB %s\n", __PRETTY_FUNCTION__);

    return nil;
}

@end
