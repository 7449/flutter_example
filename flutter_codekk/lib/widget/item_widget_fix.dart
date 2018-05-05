import 'package:flutter/material.dart';

Widget text(String data, Color color) {
  if (data == null) return new Container();
  return new Padding(
    padding: const EdgeInsets.all(8.0),
    child: new Text(data, style: new TextStyle(color: color)),
  );
}
