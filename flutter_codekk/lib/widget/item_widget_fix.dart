import 'package:flutter/material.dart';
import 'package:flutter_codekk/tool/tool.dart';

Widget text(String data, Color color) {
  if (data == null) return new Container();
  return new Padding(
    padding: const EdgeInsets.all(8.0),
    child: new Text(data, style: new TextStyle(color: color)),
  );
}

Widget aboutItem(String item, String url) {
  return new InkWell(
      onTap: () => launcherUrl(url),
      child: new Padding(
          padding: const EdgeInsets.all(12.0),
          child: new Center(
              child: new Text(item,
                  style: new TextStyle(color: Colors.pinkAccent)))));
}
