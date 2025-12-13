project(NaturalLanguage)

set(DYLIB_COMPAT_VERSION "1.0.0")
set(DYLIB_CURRENT_VERSION "1.15.19")
set(FRAMEWORK_VERSION "A")

remove_sdk_framework(NaturalLanguage
)

generate_sdk_framework(NaturalLanguage
    VERSION ${FRAMEWORK_VERSION}
    HEADER "include/NaturalLanguage"
)

add_framework(NaturalLanguage
    FAT
    CURRENT_VERSION
    VERSION ${FRAMEWORK_VERSION}

    SOURCES
        src/NaturalLanguage.m
        src/NLModelImplLC.m
        src/NLModelImplML.m
        src/NLLanguageModel.m
        src/NLModelTrainer.m
        src/NLTokenizer.m
        src/NLLexiconEntry.m
        src/NLLexiconCompletion.m
        src/NLLexiconCursor.m
        src/NLLexicon.m
        src/NLPModelTrainingDataProvider.m
        src/NLModelTrainingDataSet.m
        src/NLPModelTrainingDelegate.m
        src/NLLanguageRecognizer.m
        src/NLLogCategory.m
        src/NLModel.m
        src/NLSequenceModel.m
        src/NLClassifierModel.m
        src/NLModelImpl.m
        src/NLModelImplN.m
        src/NLModelImplL.m
        src/NLTagger.m
        src/NLPMLSequenceModel.m
        src/NLPMLClassifierModel.m
        src/NLModelConfiguration.m
        src/NLModelImplM.m
        src/NLDataInstance.m
        src/NLSequenceModelDataInstance.m
        src/NLClassifierModelDataInstance.m
        src/NLDataInstanceLocator.m
        src/NLDataProvider.m
        src/NLDataSet.m
        src/NLConstrainedDataProvider.m
        src/NLConcatenatedDataProvider.m
        src/NLSplitDataProvider.m
        src/NLDataEnumerator.m
        src/NLNumberGenerator.m

    DEPENDENCIES
        system
        objc
        Foundation
)
