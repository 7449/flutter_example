import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_album_android/flutter_album_android.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String imagePath = 'Unknown';

  Future<void> startAlbum() async {
    String _imagePath;
    try {
      _imagePath = await FlutterAlbumAndroid.albumImage;
    } on PlatformException {
      _imagePath = 'Failed to get Album ImagePath.';
    }
    if (!mounted) return;
    setState(() {
      imagePath = _imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Album Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('select album'),
                onPressed: () {
                  startAlbum();
                },
              ),
              Text(imagePath)
            ],
          ),
        ),
      ),
    );
  }
}
