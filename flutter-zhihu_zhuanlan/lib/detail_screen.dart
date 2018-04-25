import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:zhihu_zhuan_lan/entity/entity.dart';
import 'package:zhihu_zhuan_lan/values.dart';

///请求网络获取数据并使用Json转换
Future<DetailEntity> fetchDetail(slug) async {
  final response = await http.get(getDetailUrl(slug));
  return DetailEntity.fromJson(json.decode(response.body));
}

class DetailScreen extends StatelessWidget {
  final String slug;
  final String title;

  DetailScreen({@required this.slug, @required this.title});

  Widget detail(DetailEntity data) {
    String imageUrl = data.titleImage;

    return new Scaffold(
      body: new Center(
        child: new Text(data.title),
      ),
    );

//    return new WebviewScaffold();

//    return new CustomScrollView(
//      slivers: <Widget>[
//        new SliverAppBar(
//          pinned: true,
//          expandedHeight: 180.0,
//          flexibleSpace: new FlexibleSpaceBar(
//            title: new Text(title),
//            background: new FadeInImage.memoryNetwork(
//                placeholder: kTransparentImage,
//                image: imageUrl.isEmpty ? defaultImageUrl : imageUrl,
//                height: 180.0,
//                width: 1000.0,
//                fit: BoxFit.cover),
//          ),
//        ),
//        new SliverSafeArea(sliver: new Text('detail'))
//      ],
//    );
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<DetailEntity>(
      future: fetchDetail(slug),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return detail(snapshot.data);
        } else if (snapshot.hasError) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text(title),
            ),
            body: new Center(child: new Text('${snapshot.error}')),
          );
        }
        return new Scaffold(
          appBar: new AppBar(
            title: new Text(title),
          ),
          body: new Center(child: new CircularProgressIndicator()),
        );
      },
    );
  }
}
