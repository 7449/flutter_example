import 'dart:async';
import 'dart:convert';

import 'package:flutter_codekk/entity/op_entity.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:http/http.dart' as http;

const opType = ['array', 'map', 'mix'];

///http://api.codekk.com/op/page/1?type=array
Future<OpEntity> fetchOp(int page, String type) async {
  print('fetchOp:${baseUrl + opListUrl + page.toString()}');
  final response = await http.get(baseUrl + opListUrl + page.toString());
  return new OpEntity.fromJson(json.decode(response.body));
}

Future<OpEntity> fetchOpSearch() async {
  print('fetchOpSearch:${baseUrl + opSearchUrl}');
  final response = await http.get(baseUrl + opSearchUrl);
  return new OpEntity.fromJson(json.decode(response.body));
}

Future<OpEntity> fetchOpa() async {
  print('fetchOpa:${baseUrl + opaListUrl}');
  final response = await http.get(baseUrl + opaListUrl);
  return new OpEntity.fromJson(json.decode(response.body));
}

Future<OpEntity> fetchOpaSearch() async {
  print('fetchOpaSearch:${baseUrl + opaSearchUrl}');
  final response = await http.get(baseUrl + opaSearchUrl);
  return new OpEntity.fromJson(json.decode(response.body));
}

Future<OpEntity> fetchBlog() async {
  print('fetchBlog:${baseUrl + blogListUrl}');
  final response = await http.get(baseUrl + blogListUrl);
  return new OpEntity.fromJson(json.decode(response.body));
}

Future<OpEntity> fetchJob() async {
  print('fetchJob:${baseUrl + jobListUrl}');
  final response = await http.get(baseUrl + jobListUrl);
  return new OpEntity.fromJson(json.decode(response.body));
}

Future<OpEntity> fetchReadme() async {
  print('fetchReadme:${baseUrl}');
  final response = await http.get(baseUrl);
  return new OpEntity.fromJson(json.decode(response.body));
}

Future<OpEntity> fetchRecommend() async {
  print('fetchRecommend:${baseUrl + recommendListUrl}');
  final response = await http.get(baseUrl + recommendListUrl);
  return new OpEntity.fromJson(json.decode(response.body));
}

Future<OpEntity> fetchRecommendSearch() async {
  print('fetchRecommendSearch:${baseUrl + recommendSearchUrl}');
  final response = await http.get(baseUrl + recommendSearchUrl);
  return new OpEntity.fromJson(json.decode(response.body));
}
