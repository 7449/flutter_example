import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:zhihu_zhuan_lan/detail_screen.dart';
import 'package:zhihu_zhuan_lan/entity/entity.dart';
import 'package:zhihu_zhuan_lan/values.dart';

///请求网络获取数据并使用Json转换
Future<List<ListEntity>> fetchList(suffix) async {
  print(getListUrl(suffix));
  final response = await http.get(getListUrl(suffix));
  return ListEntity.fromJson(json.decode(response.body));
}

///传递一个 suffix 参数
class TabScreen extends StatelessWidget {
  final String suffix;

  TabScreen({@required this.suffix});

  ///使用 InkWell 点击有视觉反馈
  Widget listItem(context, index, ListEntity info) {
    String imageUrl = info.titleImage;
    return new Card(
        child: new InkWell(
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new DetailScreen(
                    slug: info.slug.toString(),
                    title: info.title,
                    titleImage:
                        imageUrl.isEmpty ? defaultImageUrl : imageUrl)));
      },
      child: new Column(
        children: <Widget>[
          new FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: imageUrl.isEmpty ? defaultImageUrl : imageUrl,
              height: 180.0,
              width: 1000.0,
              fit: BoxFit.cover),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(info.title),
          )
        ],
      ),
    ));
  }

  /// 这里使用`FutureBuilder`
  /// 不得不说`Flutter`封装使用的非常方便，简单的就能实现不同情况下显示不同`widget`
  /// 默认是返回一个`loading`加载框,出现错误只是简单的显示一个`Text`
  /// 数据之后使用`ListView.Builder`构建出样式
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new FutureBuilder<List<ListEntity>>(
        future: fetchList(suffix),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return new ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) =>
                    listItem(context, index, snapshot.data[index]));
          } else if (snapshot.hasError) {
            return new Center(child: new Text('${snapshot.error}'));
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
