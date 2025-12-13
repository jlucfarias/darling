/*
 This file is part of Darling.

 Copyright (C) 2025 Darling Developers

 Darling is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 Darling is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with Darling.  If not, see <http://www.gnu.org/licenses/>.
*/


#ifndef _QuickLookThumbnailing_H_
#define _QuickLookThumbnailing_H_

#import <Foundation/Foundation.h>

#import <QuickLookThumbnailing/NSExtensionRequestHandling.h>
#import <QuickLookThumbnailing/PQLResultSetInitializer.h>
#import <QuickLookThumbnailing/QLIncrementalThumbnailGenerationHandler.h>
#import <QuickLookThumbnailing/QLThumbnailAdditionIndexInterface.h>
#import <QuickLookThumbnailing/QLThumbnailGenerationRequest.h>
#import <QuickLookThumbnailing/QLThumbnailHost.h>
#import <QuickLookThumbnailing/QLThumbnailService.h>
#import <QuickLookThumbnailing/QLThumbnailServiceSurfaceGeneratorProtocol.h>
#import <QuickLookThumbnailing/QLThumbnailsInterface.h>
#import <QuickLookThumbnailing/QLUTIAnalyzer.h>
#import <QuickLookThumbnailing/QLThumbnailRequestOperation.h>
#import <QuickLookThumbnailing/QLTThumbnailOperation.h>
#import <QuickLookThumbnailing/QLCacheFileIdentifier.h>
#import <QuickLookThumbnailing/QLCacheBasicFileIdentifier.h>
#import <QuickLookThumbnailing/QLCacheFileProviderFileIdentifier.h>
#import <QuickLookThumbnailing/QLCacheVersionedFileIdentifier.h>
#import <QuickLookThumbnailing/QLCacheBasicVersionedFileIdentifier.h>
#import <QuickLookThumbnailing/QLCacheFileProviderVersionedFileIdentifier.h>
#import <QuickLookThumbnailing/QLThumbnailGenerationRequest.h>
#import <QuickLookThumbnailing/QLThumbnailGenerator.h>
#import <QuickLookThumbnailing/QLThumbnailVersion.h>
#import <QuickLookThumbnailing/QLThumbnailStoreRetrievalOperation.h>
#import <QuickLookThumbnailing/QLURLHandler.h>
#import <QuickLookThumbnailing/QLThumbnailMetadata.h>
#import <QuickLookThumbnailing/QLThumbnailServiceProxy.h>
#import <QuickLookThumbnailing/QLThumbnailCachedAddition.h>
#import <QuickLookThumbnailing/QLThumbnailAdditionCache.h>
#import <QuickLookThumbnailing/QLThumbnailAddition.h>
#import <QuickLookThumbnailing/QLServiceThumbnailRenderer.h>
#import <QuickLookThumbnailing/QLThumbnailServiceContext.h>
#import <QuickLookThumbnailing/QLThumbnailRepresentation.h>
#import <QuickLookThumbnailing/QLAsynchronousOperation.h>
#import <QuickLookThumbnailing/QLThumbnailHostContext.h>
#import <QuickLookThumbnailing/QLThumbnailAdditionEntry.h>
#import <QuickLookThumbnailing/QLTBitmapFormat.h>
#import <QuickLookThumbnailing/QLThumbnailItem.h>
#import <QuickLookThumbnailing/QLThumbnailReply.h>
#import <QuickLookThumbnailing/QLFileThumbnailRequest.h>
#import <QuickLookThumbnailing/QLThumbnailProvider.h>
#import <QuickLookThumbnailing/QLExtensionHostContextThumbnailOperation.h>
#import <QuickLookThumbnailing/QLThumbnailGenerationQueue.h>
#import <QuickLookThumbnailing/QLTThumbnailRequest.h>
#import <QuickLookThumbnailing/QLTUbiquitousFileThumbnailRequest.h>
#import <QuickLookThumbnailing/QLTFileThumbnailRequest.h>

void* QLCreateCGImageWithData(void);
void* QLCreateColorSpaceForThumbnailExtension(void);
void* QLImageCreateForDefaultThumbnailGenerationFromData(void);
void* QLShouldUseExtendedRangeForContextWithColorspace(void);
void* QLTCreateCGContext(void);
void* QLTCreateCGContextWithSize(void);
void* QLTGetDefaultCacheLocation(void);
void* QLTImageClassWithError(void);
void* QLTInitLogging(void);
void* QLTPrefersExtendedRange(void);
void* QLTSandboxWrapperForParentURLOf(void);
void* QLThumbnailRepresentationTypeToString(void);
void* _QLComputeValuesForCGContextCreationWithSizeAndScale(void);
void* _QLCopyResourcePropertyForKey(void);
void* _QLSetResourcePropertyForKey(void);

#endif
