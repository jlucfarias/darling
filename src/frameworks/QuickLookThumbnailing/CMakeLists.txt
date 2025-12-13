project(QuickLookThumbnailing)

set(DYLIB_COMPAT_VERSION "1.0.0")
set(DYLIB_CURRENT_VERSION "0.0.0")
set(FRAMEWORK_VERSION "A")

remove_sdk_framework(QuickLookThumbnailing
)

generate_sdk_framework(QuickLookThumbnailing
    VERSION ${FRAMEWORK_VERSION}
    HEADER "include/QuickLookThumbnailing"
)

add_framework(QuickLookThumbnailing
    FAT
    CURRENT_VERSION
    VERSION ${FRAMEWORK_VERSION}

    SOURCES
        src/QuickLookThumbnailing.m
        src/QLUTIAnalyzer.m
        src/QLThumbnailRequestOperation.m
        src/QLTThumbnailOperation.m
        src/QLCacheFileIdentifier.m
        src/QLCacheBasicFileIdentifier.m
        src/QLCacheFileProviderFileIdentifier.m
        src/QLCacheVersionedFileIdentifier.m
        src/QLCacheBasicVersionedFileIdentifier.m
        src/QLCacheFileProviderVersionedFileIdentifier.m
        src/QLThumbnailGenerationRequest.m
        src/QLThumbnailGenerator.m
        src/QLThumbnailVersion.m
        src/QLThumbnailStoreRetrievalOperation.m
        src/QLURLHandler.m
        src/QLThumbnailMetadata.m
        src/QLThumbnailServiceProxy.m
        src/QLThumbnailCachedAddition.m
        src/QLThumbnailAdditionCache.m
        src/QLThumbnailAddition.m
        src/QLServiceThumbnailRenderer.m
        src/QLThumbnailServiceContext.m
        src/QLThumbnailRepresentation.m
        src/QLAsynchronousOperation.m
        src/QLThumbnailHostContext.m
        src/QLThumbnailAdditionEntry.m
        src/QLTBitmapFormat.m
        src/QLThumbnailItem.m
        src/QLThumbnailReply.m
        src/QLFileThumbnailRequest.m
        src/QLThumbnailProvider.m
        src/QLExtensionHostContextThumbnailOperation.m
        src/QLThumbnailGenerationQueue.m
        src/QLTThumbnailRequest.m
        src/QLTUbiquitousFileThumbnailRequest.m
        src/QLTFileThumbnailRequest.m

    DEPENDENCIES
        system
        objc
        Foundation
)
