project(Combine LANGUAGES Swift)

set(FRAMEWORK_VERSION)

set(SOURCES
    Sources/AnyCancellable.swift
    Sources/ObservableObjectPublisher.swift
    Sources/DebugHook.swift
)

add_library(Combine SHARED ${SOURCES})

set_target_properties(Combine PROPERTIES
    FRAMEWORK TRUE
    FRAMEWORK_VERSION ${FRAMEWORK_VERSION}
    MACOSX_FRAMEWORK_IDENTIFIER com.apple.Combine
    MACOSX_FRAMEWORK_INFO_PLIST ${CMAKE_CURRENT_SOURCE_DIR}/Info.plist
    PUBLIC_HEADER ""
    XCODE_ATTRIBUTE_DEFINES_MODULE YES
)

target_compile_options(Combine PRIVATE
    "$<$<COMPILE_LANGUAGE:Swift>:-emit-module>"
)

target_link_libraries(Combine
    "-framework Foundation"
)
