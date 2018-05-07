import 'package:flutter/material.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:flutter_codekk/screen/detail/detail_screen.dart';
import 'package:flutter_codekk/screen/search/op_search_screen.dart';
import 'package:flutter_codekk/screen/search/recommend_search_screen.dart';
import 'package:flutter_codekk/screen/setting_screen.dart';
import 'package:flutter_codekk/screen/unknown_screen.dart';

void startSettingScreen(BuildContext context, VoidCallback voidCallback) {
  Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new SettingScreen(voidCallback: voidCallback)));
}

void startDetailScreen(
    BuildContext context, String title, ApiType apiType, String id) {
  Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) =>
              new ReadmeScreen(title: title, apiType: apiType, id: id)));
}

void startSearchScreen(BuildContext context, String search, ApiType type) {
  Widget widget;
  switch (type) {
    case ApiType.OP:
    case ApiType.OPA:
      widget = new OpSearchScreen(search: search);
      break;
    case ApiType.RECOMMEND:
      widget = new RecommendSearchScreen(search: search);
      break;
    default:
      widget = new UnKnowScreen(title: 'unknow');
      break;
  }
  Navigator.push(context, new MaterialPageRoute(builder: (context) => widget));
}
