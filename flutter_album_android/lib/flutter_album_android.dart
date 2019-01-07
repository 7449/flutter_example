import 'dart:async';

import 'package:flutter/services.dart';

class FlutterAlbumAndroid {
  static const MethodChannel _channel =
      const MethodChannel('flutter_album_android');

  static Future<String> get albumImage async {
    return await _channel.invokeMethod('startAlbum');
  }
}
