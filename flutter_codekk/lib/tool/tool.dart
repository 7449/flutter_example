import 'package:flutter/material.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:flutter_codekk/screen/detail/detail_screen.dart';
import 'package:flutter_codekk/screen/search/op_search_screen.dart';

void startDetailScreen(
    BuildContext context, String title, ApiType apiType, String id) {
  Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) =>
              new ReadmeScreen(title: title, apiType: apiType, id: id)));
}

void startSearchScreen(BuildContext context, String search, ApiType type) {
  StatefulWidget widget = new OpSearchScreen(search: search);
  Navigator.push(context, new MaterialPageRoute(builder: (context) => widget));
}
