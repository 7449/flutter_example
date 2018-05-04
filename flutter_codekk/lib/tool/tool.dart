import 'package:flutter/material.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:flutter_codekk/screen/detail_screen.dart';

void startDetailScreen(
    BuildContext context, String title, ApiType apiType, String id) {
  Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) =>
              new ReadmeScreen(title: title, apiType: apiType, id: id)));
}
