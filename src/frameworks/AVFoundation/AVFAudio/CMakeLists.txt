project(AVFAudio)

set(DYLIB_COMPAT_VERSION "1.0.0")
set(DYLIB_CURRENT_VERSION "2.0.0")

set(SUBFRAMEWORK_VERSION "A")

generate_sdk_subframework(AVFAudio
	BASE_PATH ${avfoundation_sdk_path}
	VERSION ${SUBFRAMEWORK_VERSION}
	HEADER "include/AVFAudio"
)

add_framework(AVFAudio
	FAT
	CURRENT_VERSION
	VERSION ${SUBFRAMEWORK_VERSION}
	PARENT "AVFoundation"

	SOURCES
		src/AVAudioPlayer.m

	DEPENDENCIES
		CoreFoundation
		Foundation
		system
)
