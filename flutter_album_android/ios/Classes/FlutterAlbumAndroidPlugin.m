#import "FlutterAlbumAndroidPlugin.h"
#if __has_include(<flutter_album_android/flutter_album_android-Swift.h>)
#import <flutter_album_android/flutter_album_android-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_album_android-Swift.h"
#endif

@implementation FlutterAlbumAndroidPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterAlbumAndroidPlugin registerWithRegistrar:registrar];
}
@end
