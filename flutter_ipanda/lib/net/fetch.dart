import 'dart:async';
import 'dart:convert';

import 'package:flutter_ipanda/entity/broad_cast_entity.dart';
import 'package:flutter_ipanda/entity/home_entity.dart';
import 'package:flutter_ipanda/entity/live_china_entity.dart';
import 'package:flutter_ipanda/entity/panda_live_entity.dart';
import 'package:flutter_ipanda/entity/tab_entity.dart';
import 'package:flutter_ipanda/entity/video_entity.dart';
import 'package:flutter_ipanda/net/api.dart';
import 'package:flutter_ipanda/value.dart';
import 'package:http/http.dart' as http;

/// 底部 tab ,未使用
Future<TabEntity> fetchTab() async {
  print('fetchTab:${baseUrl + type + tabUrl}');
  final response = await http.get(baseUrl + type + tabUrl);
  return TabEntity.fromJson(json.decode(response.body));
}

/// 首页
Future<BaseHomeEntity> fetchHome() async {
  print('fetchHome:${tabUrlAction[0]}');
  final response = await http.get(tabUrlAction[0]);
  return BaseHomeEntity.fromJson(json.decode(response.body));
}

/// 首页 --> 精彩一刻
Future<HomeWonderfulEntity> fetchWonderful(String url) async {
  print('fetchWonderful:$url');
  final response = await http.get(url);
  return HomeWonderfulEntity.fromJson(json.decode(response.body));
}

/// 首页 --> 滚滚视频
Future<HomePandaVideoEntity> fetchPandaVideo(String url) async {
  print('fetchPandaVideo:$url');
  final response = await http.get(url);
  return HomePandaVideoEntity.fromJson(json.decode(response.body));
}

/// 熊猫直播
Future<BasePandaLiveEntity> fetchPandaLive() async {
  print('fetchPandaLive:${tabUrlAction[1]}');
  final response = await http.get(tabUrlAction[1]);
  return BasePandaLiveEntity.fromJson(json.decode(response.body));
}

/// 熊猫直播 --> 直播
Future<PandaLivePandaEntity> fetchPandaLives(String url) async {
  print('fetchPandaLives:$url');
  final response = await http.get(url);
  return PandaLivePandaEntity.fromJson(json.decode(response.body));
}

/// 熊猫直播 --> 直播 --> 多视角直播
Future<PandaMultipleEntity> fetchPandaLiveMultiple(String url) async {
  print('fetchPandaLiveMultiple:$url');
  final response = await http.get(url);
  return PandaMultipleEntity.fromJson(json.decode(response.body));
}

/// 熊猫直播 --> 直播 --> 边看边聊
Future<PandaWatchTalkEntity> fetchPandaLiveWatchTalk(int page) async {
  print('fetchPandaLiveWatchTalk:${watchTalkUrl + page.toString()}');
  final response = await http.get(watchTalkUrl + page.toString());
  return PandaWatchTalkEntity.fromJson(json.decode(response.body)['data']);
}

/// 滚滚视频
Future<BaseVideoEntity> fetchVideo() async {
  print('fetchVideo:${tabUrlAction[2]}');
  final response = await http.get(tabUrlAction[2]);
  return BaseVideoEntity.fromJson(json.decode(response.body));
}

/// 熊猫播报
Future<BaseBroadcastEntity> fetchBroadcast() async {
  print('fetchBroadcast:${tabUrlAction[3]}');
  final response = await http.get(tabUrlAction[3]);
  return BaseBroadcastEntity.fromJson(json.decode(response.body)['data']);
}

/// 熊猫播报 --> 列表
Future<BroadcastListEntity> fetchBroadcastList(String url) async {
  print('fetchBroadcastList:$url');
  final response = await http.get(url);
  return BroadcastListEntity.fromJson(json.decode(response.body));
}

/// 直播中国
Future<BaseLiveChinaEntity> fetchLiveChina() async {
  print('fetchLiveChina:${tabUrlAction[4]}');
  final response = await http.get(tabUrlAction[4]);
  return BaseLiveChinaEntity.fromJson(json.decode(response.body));
}

/// 直播中国 --> 列表
Future<LiveChinaBaseListEntity> fetchLiveChinaList(String url) async {
  print('fetchLiveChinaList:$url');
  final response = await http.get(url);
  return LiveChinaBaseListEntity.fromJson(json.decode(response.body));
}
