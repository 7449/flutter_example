import 'package:flutter/material.dart';
import 'package:flutter_ipanda/entity/live_china_entity.dart';
import 'package:flutter_ipanda/net/fetch.dart';
import 'package:transparent_image/transparent_image.dart';

class ListScreen extends StatefulWidget {
  final String url;

  ListScreen({this.url});

  @override
  State<StatefulWidget> createState() => ListState();
}

class ListState extends State<ListScreen> {
  int position = -1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LiveChinaBaseListEntity>(
      future: fetchLiveChinaList(widget.url),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _build(context, snapshot.data.live);
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _build(BuildContext context, List<LiveChinaListEntity> entity) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: entity.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            margin: EdgeInsets.all(4.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: entity[index].image,
                          height: 200.0,
                          width: size.width,
                          fit: BoxFit.cover),
                      InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.play_arrow,
                            size: 40.0,
                            color: Colors.blue,
                          ))
                    ],
                  ),
                  Padding(
                    child: Text('[正在直播]${entity[index].title}',
                        style: TextStyle(fontSize: 16.0)),
                    padding:
                        EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  ),
                  Padding(
                    child: Row(children: <Widget>[
                      Text('简介:',
                          style: TextStyle(fontSize: 16.0, color: Colors.grey)),
                      IconButton(
                        onPressed: () {
                          position = position == index ? -1 : index;
                          setState(() {});
                        },
                        icon: Icon(position == index
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up),
                        color: Colors.grey,
                      )
                    ]),
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  ),
                  Divider(height: 2.0, color: Colors.black26),
                  position == index
                      ? Column(children: <Widget>[
                          Padding(
                            child: Text(entity[index].brief,
                                style: TextStyle(fontSize: 16.0)),
                            padding: EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 10.0),
                          ),
                          Divider(height: 2.0, color: Colors.black26),
                        ])
                      : Container(),
                ]));
      },
    );
  }
}
