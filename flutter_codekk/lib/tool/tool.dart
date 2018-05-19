import 'package:flutter/material.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:flutter_codekk/screen/about_screen.dart';
import 'package:flutter_codekk/screen/detail/detail_screen.dart';
import 'package:flutter_codekk/screen/search/op_search_screen.dart';
import 'package:flutter_codekk/screen/search/recommend_search_screen.dart';
import 'package:flutter_codekk/screen/setting_screen.dart';
import 'package:flutter_codekk/screen/unknown_screen.dart';
import 'package:url_launcher/url_launcher.dart';

void startSettingScreen(BuildContext context, VoidCallback voidCallback) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SettingScreen(voidCallback: voidCallback)));
}

void startAboutScreen(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => AboutScreen()));
}

void startDetailScreen(
    BuildContext context, String title, ApiType apiType, String id) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ReadmeScreen(title: title, apiType: apiType, id: id)));
}

void startSearchScreen(BuildContext context, String search, ApiType type) {
  Widget widget;
  switch (type) {
    case ApiType.OP:
    case ApiType.OPA:
      widget = OpSearchScreen(search: search);
      break;
    case ApiType.RECOMMEND:
      widget = RecommendSearchScreen(search: search);
      break;
    default:
      widget = UnKnowScreen();
      break;
  }
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

launcherUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}
