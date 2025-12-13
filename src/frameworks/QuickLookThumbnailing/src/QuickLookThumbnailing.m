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


#include <QuickLookThumbnailing/QuickLookThumbnailing.h>
#include <stdlib.h>
#include <stdio.h>

static int verbose = 0;

__attribute__((constructor))
static void initme(void) {
    verbose = getenv("STUB_VERBOSE") != NULL;
}

void* QLCreateCGImageWithData(void)
{
    if (verbose) puts("STUB: QLCreateCGImageWithData called");
    return NULL;
}

void* QLCreateColorSpaceForThumbnailExtension(void)
{
    if (verbose) puts("STUB: QLCreateColorSpaceForThumbnailExtension called");
    return NULL;
}

void* QLImageCreateForDefaultThumbnailGenerationFromData(void)
{
    if (verbose) puts("STUB: QLImageCreateForDefaultThumbnailGenerationFromData called");
    return NULL;
}

void* QLShouldUseExtendedRangeForContextWithColorspace(void)
{
    if (verbose) puts("STUB: QLShouldUseExtendedRangeForContextWithColorspace called");
    return NULL;
}

void* QLTCreateCGContext(void)
{
    if (verbose) puts("STUB: QLTCreateCGContext called");
    return NULL;
}

void* QLTCreateCGContextWithSize(void)
{
    if (verbose) puts("STUB: QLTCreateCGContextWithSize called");
    return NULL;
}

void* QLTGetDefaultCacheLocation(void)
{
    if (verbose) puts("STUB: QLTGetDefaultCacheLocation called");
    return NULL;
}

void* QLTImageClassWithError(void)
{
    if (verbose) puts("STUB: QLTImageClassWithError called");
    return NULL;
}

void* QLTInitLogging(void)
{
    if (verbose) puts("STUB: QLTInitLogging called");
    return NULL;
}

void* QLTPrefersExtendedRange(void)
{
    if (verbose) puts("STUB: QLTPrefersExtendedRange called");
    return NULL;
}

void* QLTSandboxWrapperForParentURLOf(void)
{
    if (verbose) puts("STUB: QLTSandboxWrapperForParentURLOf called");
    return NULL;
}

void* QLThumbnailRepresentationTypeToString(void)
{
    if (verbose) puts("STUB: QLThumbnailRepresentationTypeToString called");
    return NULL;
}

void* _QLComputeValuesForCGContextCreationWithSizeAndScale(void)
{
    if (verbose) puts("STUB: _QLComputeValuesForCGContextCreationWithSizeAndScale called");
    return NULL;
}

void* _QLCopyResourcePropertyForKey(void)
{
    if (verbose) puts("STUB: _QLCopyResourcePropertyForKey called");
    return NULL;
}

void* _QLSetResourcePropertyForKey(void)
{
    if (verbose) puts("STUB: _QLSetResourcePropertyForKey called");
    return NULL;
}
