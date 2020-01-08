import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_zhihu_zhuanlan/entity/entity.dart';
import 'package:flutter_zhihu_zhuanlan/values.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:transparent_image/transparent_image.dart';

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
    return FutureBuilder<DetailEntity>(
      future: fetchDetail(slug),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RichText(
                    text: TextSpan(
                        text: snapshot.data.content,
                        style: DefaultTextStyle.of(context).style),
                  )));
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 180.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(title, maxLines: 1),
              centerTitle: false,
              background: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: titleImage,
                  height: 180.0,
                  width: 1000.0,
                  fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(child: boxAdapterWidget(context))
        ],
      ),
    );
  }
}
