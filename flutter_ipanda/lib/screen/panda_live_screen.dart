import 'package:flutter/material.dart';
import 'package:flutter_ipanda/entity/panda_live_entity.dart';
import 'package:flutter_ipanda/net/fetch.dart';
import 'package:flutter_ipanda/screen/live/live_ipanda_screen.dart';
import 'package:flutter_ipanda/screen/live/live_screen.dart';
import 'package:flutter_ipanda/value.dart';
import 'package:flutter_ipanda/widget/status_widget.dart';

class PandaLiveScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PandaLiveState();
}

class PandaLiveState extends State<PandaLiveScreen>
    with TickerProviderStateMixin {
  TabController tabController;
  List<PandaLiveTabListEntity> list = [];
  Status status = Status.LOADING;

  @override
  void initState() {
    super.initState();
    http();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(tabs[1]),
            bottom: status != Status.SUCCESS
                ? null
                : TabBar(
                    controller: tabController,
                    tabs: bottomTabs(list),
                    isScrollable: true,
                  )),
        body: StatusWidget(
          child: TabBarView(controller: tabController, children: body(list)),
          status: status,
          onErrorPressed: () => http(),
          onEmptyPressed: () => http(),
        ));
  }

  /// 另一种实现方式
  ///
  ///  @override
  ///  Widget build(BuildContext context) {
  ///    return FutureBuilder<TabLiveEntity>(
  ///      future: fetchPandaLive(),
  ///      builder: (context, snapshot) {
  ///        if (snapshot.hasData) {
  ///          return _build(snapshot.data.tabList);
  ///        } else if (snapshot.hasError) {
  ///          return Scaffold(
  ///              appBar: AppBar(title: Text(tabs[1])),
  ///              body: Center(child: Text('${snapshot.error}')));
  ///        }
  ///        return Scaffold(
  ///            appBar: AppBar(title: Text(tabs[1])),
  ///            body: Center(child: CircularProgressIndicator()));
  ///      },
  ///    );
  ///  }
  ///
  ///  Widget _build(List<LiveTabListEntity> entity) {
  ///    tabController = TabController(vsync: this, length: entity.length);
  ///    return Scaffold(
  ///        appBar: AppBar(
  ///            title: Text(tabs[1]),
  ///            bottom: TabBar(
  ///              controller: tabController,
  ///              tabs: bottomTabs(entity),
  ///              isScrollable: true,
  ///            )),
  ///        body: TabBarView(controller: tabController, children: body(entity)));
  ///  }

  List<Widget> bottomTabs(List<PandaLiveTabListEntity> entity) {
    return entity.map((item) => Tab(text: item.title)).toList();
  }

  List<Widget> body(List<PandaLiveTabListEntity> entity) {
    return entity.map((item) {
      switch (item.order) {
        case "1":
          return LivePandaScreen(url: item.url);
        default:
          return LiveScreen();
      }
    }).toList();
  }

  http() {
    fetchPandaLive().then((entity) {
      tabController = TabController(vsync: this, length: entity.tabList.length);
      status = Status.SUCCESS;
      list = entity.tabList;
      setState(() {});
    }).catchError((error) {
      status = Status.ERROR;
      setState(() {});
    });
  }
}
