import 'package:flutter/material.dart';
import 'package:flutter_codekk/home_screen.dart';

void main() => runApp(MainScreen());

enum Theme { LIGHT, RIGHT }

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainState();
}

class MainState extends State<MainScreen> {
  ThemeData themeData = ThemeData.light();
  Theme theme = Theme.LIGHT;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: themeData,
        home: HomeScreen(voidCallback: () {
          themeData =
              theme == Theme.LIGHT ? ThemeData.dark() : ThemeData.light();
          theme = theme == Theme.LIGHT ? Theme.RIGHT : Theme.LIGHT;
          setState(() {});
        }));
  }
}
