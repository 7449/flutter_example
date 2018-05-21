import 'package:flutter/material.dart';

class PandaHomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text('Home');
//    return FutureBuilder<List<ListEntity>>(
//      future: fetchList(suffix),
//      builder: (context, snapshot) {
//        if (snapshot.hasData) {
//          return ListView.builder(
//              itemCount: snapshot.data.length,
//              itemBuilder: (context, index) =>
//                  listItem(context, index, snapshot.data[index]));
//        } else if (snapshot.hasError) {
//          return Center(child: Text('${snapshot.error}'));
//        }
//        return CircularProgressIndicator();
//      },
//    )
//    ,;
  }
}
