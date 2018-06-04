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

Future<TabEntity> fetchTab() async {
  print('fetchTab:${baseUrl + type + tabUrl}');
  final response = await http.get(baseUrl + type + tabUrl);
  return TabEntity.fromJson(json.decode(response.body));
}

Future<BaseHomeEntity> fetchHome() async {
  print('fetchHome:${tabUrlAction[0]}');
  final response = await http.get(tabUrlAction[0]);
  return BaseHomeEntity.fromJson(json.decode(response.body));
}

Future<HomeWonderfulEntity> fetchWonderful(String url) async {
  print('fetchWonderful:$url');
  final response = await http.get(url);
  return HomeWonderfulEntity.fromJson(json.decode(response.body));
}

Future<HomePandaVideoEntity> fetchPandaVideo(String url) async {
  print('fetchPandaVideo:$url');
  final response = await http.get(url);
  return HomePandaVideoEntity.fromJson(json.decode(response.body));
}

Future<BasePandaLiveEntity> fetchPandaLive() async {
  print('fetchPandaLive:${tabUrlAction[1]}');
  final response = await http.get(tabUrlAction[1]);
  return BasePandaLiveEntity.fromJson(json.decode(response.body));
}

Future<PandaLivePandaEntity> fetchPandaLives(String url) async {
  print('fetchPandaLives:$url');
  final response = await http.get(url);
  return PandaLivePandaEntity.fromJson(json.decode(response.body));
}

Future<PandaMultipleEntity> fetchPandaLiveMultipleEntity(String url) async {
  print('fetchPandaLiveMultiple:$url');
  final response = await http.get(url);
  return PandaMultipleEntity.fromJson(json.decode(response.body));
}

Future<BaseVideoEntity> fetchVideoEntity() async {
  print('fetchVideoEntity:${tabUrlAction[2]}');
  final response = await http.get(tabUrlAction[2]);
  return BaseVideoEntity.fromJson(json.decode(response.body));
}

Future<BaseBroadcastEntity> fetchBroadcastEntity() async {
  print('fetchBroadcastEntity:${tabUrlAction[3]}');
  final response = await http.get(tabUrlAction[3]);
  return BaseBroadcastEntity.fromJson(json.decode(response.body)['data']);
}

Future<BroadcastListEntity> fetchBroadcastListEntity(String url) async {
  print('fetchBroadcastEntity:$url');
  final response = await http.get(url);
  return BroadcastListEntity.fromJson(json.decode(response.body));
}

Future<BaseLiveChinaEntity> fetchLiveChinaEntity() async {
  print('fetchLiveChinaEntity:${tabUrlAction[4]}');
  final response = await http.get(tabUrlAction[4]);
  return BaseLiveChinaEntity.fromJson(json.decode(response.body));
}
