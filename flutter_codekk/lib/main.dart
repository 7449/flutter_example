import 'package:flutter/material.dart';
import 'package:flutter_codekk/home_screen.dart';

void main() => runApp(new MainScreen());

enum Theme { LIGHT, RIGHT }

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MainState();
}

class MainState extends State<MainScreen> {
  ThemeData themeData = new ThemeData.light();
  Theme theme = Theme.LIGHT;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: themeData,
        home: new HomeScreen(voidCallback: () {
          themeData = theme == Theme.LIGHT
              ? new ThemeData.dark()
              : new ThemeData.light();
          theme = theme == Theme.LIGHT ? Theme.RIGHT : Theme.LIGHT;
          setState(() {});
        }));
  }
}
