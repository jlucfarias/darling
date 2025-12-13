project(CryptoKit)

set(DYLIB_COMPAT_VERSION "1.0.0")
set(DYLIB_CURRENT_VERSION "1.0.0")
set(FRAMEWORK_VERSION "A")

remove_sdk_framework(CryptoKit
)

generate_sdk_framework(CryptoKit
    VERSION ${FRAMEWORK_VERSION}
    HEADER "include/CryptoKit"
)

add_framework(CryptoKit
    FAT
    CURRENT_VERSION
    VERSION ${FRAMEWORK_VERSION}

    SOURCES
        src/CryptoKit.m
        src/_TtCV9CryptoKit17CoreCryptoGCMImplP33_A4BAE8898ACAD702674B710A7536C9C17Context.m
        src/_TtCV9CryptoKit24CoreCryptoChaChaPolyImplP33_1EEA2C15408765EA775A4381D63577DE7Context.m

    DEPENDENCIES
        system
        objc
        Foundation
)
