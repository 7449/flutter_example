import 'package:flutter/material.dart';
import 'package:flutter_codekk/tool/tool.dart';

Widget text(String data, Color color) {
  if (data == null) return Container();
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(data, style: TextStyle(color: color)),
  );
}

Widget aboutItem(String item, String url) {
  return InkWell(
      onTap: () => launcherUrl(url),
      child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Center(
              child: Text(item, style: TextStyle(color: Colors.pinkAccent)))));
}
