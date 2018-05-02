import 'package:flutter/material.dart';
import 'package:flutter_codekk/entity/op_entity.dart';
import 'package:flutter_codekk/net/fetch.dart';
import 'package:meta/meta.dart';

///  开源项目
class OpScreen extends StatelessWidget {
  final String title;

  OpScreen({@required this.title});

  Widget listItem(context, index, ProjectArrayEntity info) {
    return new Card(
        child: new InkWell(
      onTap: () {},
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new Text('${info.projectName}',
                style: new TextStyle(color: Colors.green)),
          ),
          new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new Text('${info.desc}',
                style: new TextStyle(color: Colors.blue)),
          ),
          new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new Text('${info.projectUrl}',
                style: new TextStyle(color: Colors.pinkAccent)),
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new FutureBuilder<OpEntity>(
        future: fetchOp(1, ''),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return new ListView.builder(
                itemCount: snapshot.data.data.projectArray.length,
                itemBuilder: (context, index) => listItem(
                    context, index, snapshot.data.data.projectArray[index]));
          } else if (snapshot.hasError) {
            return new Center(child: new Text('${snapshot.error}'));
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
