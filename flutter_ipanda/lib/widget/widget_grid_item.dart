import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class HeaderItem extends StatelessWidget {
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.all(10.0),
        child: Text(title, style: TextStyle(color: Colors.blue)));
  }

  HeaderItem({this.title});
}

class ListItem extends StatelessWidget {
  final image;
  final imageTitle;
  final title;
  final subTitle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(children: <Widget>[
      Stack(alignment: AlignmentDirectional.bottomStart, children: <Widget>[
        Container(
            width: size.width / 3,
            height: size.width / 5,
            child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: image,
                fit: BoxFit.cover)),
        Container(
            margin: EdgeInsets.all(4.0),
            child: Text(imageTitle,
                style: TextStyle(color: Colors.white, fontSize: 12.0)))
      ]),
      Expanded(
          child: Container(
              margin: EdgeInsets.only(top: 6.0, left: 10.0, right: 10.0),
              child: Column(children: <Widget>[
                Expanded(
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(title, style: TextStyle(fontSize: 12.0)))),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child:
                            Text(subTitle, style: TextStyle(fontSize: 10.0))))
              ])))
    ]);
  }

  ListItem({this.image, this.imageTitle, this.title, this.subTitle});
}

class GridItem extends StatelessWidget {
  final String title;
  final String littleTitle;
  final String image;
  final String imageTitle;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Stack(alignment: AlignmentDirectional.bottomStart, children: <Widget>[
        FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: image,
            height: imageHeight,
            fit: BoxFit.cover),
        Padding(
          child: Text(imageTitle, style: TextStyle(color: Colors.white)),
          padding: EdgeInsets.all(2.0),
        ),
      ]),
      bottomTitle(),
    ]));
  }

  Widget bottomTitle() {
    print(littleTitle);
    if (littleTitle == null) {
      return Expanded(
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(title, style: TextStyle(fontSize: 12.0))));
    }
    return Expanded(
        child: Column(children: <Widget>[
      Container(
          alignment: Alignment.topLeft,
          child: Text(title, style: TextStyle(fontSize: 12.0))),
      Expanded(
          child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(littleTitle, style: TextStyle(fontSize: 10.0))))
    ]));
  }

  GridItem({
    this.title,
    this.littleTitle,
    this.image,
    this.imageTitle,
    this.imageHeight,
  });
}
