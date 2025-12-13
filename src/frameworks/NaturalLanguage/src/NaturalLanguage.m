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


#include <NaturalLanguage/NaturalLanguage.h>
#include <stdlib.h>
#include <stdio.h>

static int verbose = 0;

__attribute__((constructor))
static void initme(void) {
    verbose = getenv("STUB_VERBOSE") != NULL;
}

void* NLPClassifierModelCopyData(void)
{
    if (verbose) puts("STUB: NLPClassifierModelCopyData called");
    return NULL;
}

void* NLPClassifierModelCopyPredictedLabelForText(void)
{
    if (verbose) puts("STUB: NLPClassifierModelCopyPredictedLabelForText called");
    return NULL;
}

void* NLPClassifierModelCopyTestResults(void)
{
    if (verbose) puts("STUB: NLPClassifierModelCopyTestResults called");
    return NULL;
}

void* NLPClassifierModelCreateTrainedModelWithData(void)
{
    if (verbose) puts("STUB: NLPClassifierModelCreateTrainedModelWithData called");
    return NULL;
}

void* NLPClassifierModelCreateWithData(void)
{
    if (verbose) puts("STUB: NLPClassifierModelCreateWithData called");
    return NULL;
}

void* NLPClassifierModelCreateWithURL(void)
{
    if (verbose) puts("STUB: NLPClassifierModelCreateWithURL called");
    return NULL;
}

void* NLPClassifierModelGetCurrentRevision(void)
{
    if (verbose) puts("STUB: NLPClassifierModelGetCurrentRevision called");
    return NULL;
}

void* NLPClassifierModelGetRevision(void)
{
    if (verbose) puts("STUB: NLPClassifierModelGetRevision called");
    return NULL;
}

void* NLPClassifierModelIsRevisionSupported(void)
{
    if (verbose) puts("STUB: NLPClassifierModelIsRevisionSupported called");
    return NULL;
}

void* NLPClassifierModelWriteCoreMLModelToURL(void)
{
    if (verbose) puts("STUB: NLPClassifierModelWriteCoreMLModelToURL called");
    return NULL;
}

void* NLPClassifierModelWriteCoreMLModelToURLWithOptions(void)
{
    if (verbose) puts("STUB: NLPClassifierModelWriteCoreMLModelToURLWithOptions called");
    return NULL;
}

void* NLPClassifierModelWriteToURL(void)
{
    if (verbose) puts("STUB: NLPClassifierModelWriteToURL called");
    return NULL;
}

void* NLPSequenceModelCopyData(void)
{
    if (verbose) puts("STUB: NLPSequenceModelCopyData called");
    return NULL;
}

void* NLPSequenceModelCopyPredictedLabelsForTokens(void)
{
    if (verbose) puts("STUB: NLPSequenceModelCopyPredictedLabelsForTokens called");
    return NULL;
}

void* NLPSequenceModelCopyPredictedTokensAndLabelsForText(void)
{
    if (verbose) puts("STUB: NLPSequenceModelCopyPredictedTokensAndLabelsForText called");
    return NULL;
}

void* NLPSequenceModelCopyTestResults(void)
{
    if (verbose) puts("STUB: NLPSequenceModelCopyTestResults called");
    return NULL;
}

void* NLPSequenceModelCreateTrainedModelWithData(void)
{
    if (verbose) puts("STUB: NLPSequenceModelCreateTrainedModelWithData called");
    return NULL;
}

void* NLPSequenceModelCreateWithData(void)
{
    if (verbose) puts("STUB: NLPSequenceModelCreateWithData called");
    return NULL;
}

void* NLPSequenceModelCreateWithURL(void)
{
    if (verbose) puts("STUB: NLPSequenceModelCreateWithURL called");
    return NULL;
}

void* NLPSequenceModelGetCurrentRevision(void)
{
    if (verbose) puts("STUB: NLPSequenceModelGetCurrentRevision called");
    return NULL;
}

void* NLPSequenceModelGetRevision(void)
{
    if (verbose) puts("STUB: NLPSequenceModelGetRevision called");
    return NULL;
}

void* NLPSequenceModelIsRevisionSupported(void)
{
    if (verbose) puts("STUB: NLPSequenceModelIsRevisionSupported called");
    return NULL;
}

void* NLPSequenceModelWriteCoreMLModelToURL(void)
{
    if (verbose) puts("STUB: NLPSequenceModelWriteCoreMLModelToURL called");
    return NULL;
}

void* NLPSequenceModelWriteCoreMLModelToURLWithOptions(void)
{
    if (verbose) puts("STUB: NLPSequenceModelWriteCoreMLModelToURLWithOptions called");
    return NULL;
}

void* NLPSequenceModelWriteToURL(void)
{
    if (verbose) puts("STUB: NLPSequenceModelWriteToURL called");
    return NULL;
}
