import 'package:flutter/material.dart';
import 'package:flutter_ipanda/entity/video_entity.dart';
import 'package:flutter_ipanda/net/fetch.dart';
import 'package:flutter_ipanda/value.dart';
import 'package:flutter_ipanda/widget/widget_grid_item.dart';
import 'package:transparent_image/transparent_image.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tabs[2])),
      body: FutureBuilder<BaseVideoEntity>(
        future: fetchVideo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _build(context, snapshot.data);
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _build(BuildContext context, BaseVideoEntity entity) {
    return ListView.builder(
      itemCount: entity.list.length + entity.bigImg.length,
      itemBuilder: (context, index) {
        if (index < entity.bigImg.length) {
          return _bigImage(context, entity.bigImg[index]);
        }
        return _list(context, entity.list[index - entity.bigImg.length]);
      },
    );
  }

  Widget _list(BuildContext context, VideoListEntity entity) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.width / 5,
        padding: EdgeInsets.all(4.0),
        child: ListItem(
          image: entity.image,
          imageTitle: entity.videoLength,
          title: entity.title,
          subTitle: entity.brief,
        ));
  }

  Widget _bigImage(BuildContext context, VideoBigImageEntity entity) {
    return Stack(alignment: Alignment.bottomLeft, children: <Widget>[
      FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: entity.image,
          fit: BoxFit.cover),
      Text(entity.title, style: TextStyle(color: Colors.white))
    ]);
  }
}
