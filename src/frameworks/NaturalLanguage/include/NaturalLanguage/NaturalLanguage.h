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


#ifndef _NaturalLanguage_H_
#define _NaturalLanguage_H_

#import <Foundation/Foundation.h>

#import <NaturalLanguage/MLCustomModel.h>
#import <NaturalLanguage/NLLogging.h>
#import <NaturalLanguage/NLModelTrainerDelegate.h>
#import <NaturalLanguage/NLModelImplLC.h>
#import <NaturalLanguage/NLModelImplML.h>
#import <NaturalLanguage/NLLanguageModel.h>
#import <NaturalLanguage/NLModelTrainer.h>
#import <NaturalLanguage/NLTokenizer.h>
#import <NaturalLanguage/NLLexiconEntry.h>
#import <NaturalLanguage/NLLexiconCompletion.h>
#import <NaturalLanguage/NLLexiconCursor.h>
#import <NaturalLanguage/NLLexicon.h>
#import <NaturalLanguage/NLPModelTrainingDataProvider.h>
#import <NaturalLanguage/NLModelTrainingDataSet.h>
#import <NaturalLanguage/NLPModelTrainingDelegate.h>
#import <NaturalLanguage/NLLanguageRecognizer.h>
#import <NaturalLanguage/NLLogCategory.h>
#import <NaturalLanguage/NLModel.h>
#import <NaturalLanguage/NLSequenceModel.h>
#import <NaturalLanguage/NLClassifierModel.h>
#import <NaturalLanguage/NLModelImpl.h>
#import <NaturalLanguage/NLModelImplN.h>
#import <NaturalLanguage/NLModelImplL.h>
#import <NaturalLanguage/NLTagger.h>
#import <NaturalLanguage/NLPMLSequenceModel.h>
#import <NaturalLanguage/NLPMLClassifierModel.h>
#import <NaturalLanguage/NLModelConfiguration.h>
#import <NaturalLanguage/NLModelImplM.h>
#import <NaturalLanguage/NLDataInstance.h>
#import <NaturalLanguage/NLSequenceModelDataInstance.h>
#import <NaturalLanguage/NLClassifierModelDataInstance.h>
#import <NaturalLanguage/NLDataInstanceLocator.h>
#import <NaturalLanguage/NLDataProvider.h>
#import <NaturalLanguage/NLDataSet.h>
#import <NaturalLanguage/NLConstrainedDataProvider.h>
#import <NaturalLanguage/NLConcatenatedDataProvider.h>
#import <NaturalLanguage/NLSplitDataProvider.h>
#import <NaturalLanguage/NLDataEnumerator.h>
#import <NaturalLanguage/NLNumberGenerator.h>

void* NLPClassifierModelCopyData(void);
void* NLPClassifierModelCopyPredictedLabelForText(void);
void* NLPClassifierModelCopyTestResults(void);
void* NLPClassifierModelCreateTrainedModelWithData(void);
void* NLPClassifierModelCreateWithData(void);
void* NLPClassifierModelCreateWithURL(void);
void* NLPClassifierModelGetCurrentRevision(void);
void* NLPClassifierModelGetRevision(void);
void* NLPClassifierModelIsRevisionSupported(void);
void* NLPClassifierModelWriteCoreMLModelToURL(void);
void* NLPClassifierModelWriteCoreMLModelToURLWithOptions(void);
void* NLPClassifierModelWriteToURL(void);
void* NLPSequenceModelCopyData(void);
void* NLPSequenceModelCopyPredictedLabelsForTokens(void);
void* NLPSequenceModelCopyPredictedTokensAndLabelsForText(void);
void* NLPSequenceModelCopyTestResults(void);
void* NLPSequenceModelCreateTrainedModelWithData(void);
void* NLPSequenceModelCreateWithData(void);
void* NLPSequenceModelCreateWithURL(void);
void* NLPSequenceModelGetCurrentRevision(void);
void* NLPSequenceModelGetRevision(void);
void* NLPSequenceModelIsRevisionSupported(void);
void* NLPSequenceModelWriteCoreMLModelToURL(void);
void* NLPSequenceModelWriteCoreMLModelToURLWithOptions(void);
void* NLPSequenceModelWriteToURL(void);

#endif
