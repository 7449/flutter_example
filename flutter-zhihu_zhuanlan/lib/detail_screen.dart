import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:transparent_image/transparent_image.dart';
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
  final String titleImage;

  DetailScreen(
      {@required this.slug, @required this.title, @required this.titleImage});

  Widget boxAdapterWidget(context) {
    return new FutureBuilder<DetailEntity>(
      future: fetchDetail(slug),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return new Center(
              child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new RichText(
                    text: new TextSpan(
                        text: snapshot.data.content,
                        style: DefaultTextStyle.of(context).style),
                  )));
        } else if (snapshot.hasError) {
          return new Center(child: new Text('${snapshot.error}'));
        }
        return const Center(child: const CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            pinned: true,
            expandedHeight: 180.0,
            flexibleSpace: new FlexibleSpaceBar(
              title: new Text(title, maxLines: 1),
              centerTitle: false,
              background: new FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: titleImage,
                  height: 180.0,
                  width: 1000.0,
                  fit: BoxFit.cover),
            ),
          ),
          new SliverToBoxAdapter(child: boxAdapterWidget(context))
        ],
      ),
    );
  }
}
