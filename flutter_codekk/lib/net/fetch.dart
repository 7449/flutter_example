import 'dart:async';
import 'dart:convert';

import 'package:flutter_codekk/entity/blog_entity.dart';
import 'package:flutter_codekk/entity/job_entity.dart';
import 'package:flutter_codekk/entity/op_entity.dart';
import 'package:flutter_codekk/entity/opa_entity.dart';
import 'package:flutter_codekk/entity/recommend_entity.dart';
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

///http://api.codekk.com/opa/page/1
Future<OpaEntity> fetchOpa(int page) async {
  print('fetchOpa:${baseUrl + opaListUrl + page.toString()}');
  final response = await http.get(baseUrl + opaListUrl + page.toString());
  return new OpaEntity.fromJson(json.decode(response.body));
}

Future<OpEntity> fetchOpaSearch() async {
  print('fetchOpaSearch:${baseUrl + opaSearchUrl}');
  final response = await http.get(baseUrl + opaSearchUrl);
  return new OpEntity.fromJson(json.decode(response.body));
}

///http://api.codekk.com/blog/page/1
Future<BlogEntity> fetchBlog(int page) async {
  print('fetchBlog:${baseUrl + blogListUrl + page.toString()}');
  final response = await http.get(baseUrl + blogListUrl + page.toString());
  return new BlogEntity.fromJson(json.decode(response.body));
}

///http://api.codekk.com/job/page/1
Future<JobEntity> fetchJob(int page) async {
  print('fetchJob:${baseUrl + jobListUrl + page.toString()}');
  final response = await http.get(baseUrl + jobListUrl + page.toString());
  return new JobEntity.fromJson(json.decode(response.body));
}

Future<OpEntity> fetchReadme() async {
  print('fetchReadme:${baseUrl}');
  final response = await http.get(baseUrl);
  return new OpEntity.fromJson(json.decode(response.body));
}

///http://api.codekk.com/recommend/page/1
Future<RecommendEntity> fetchRecommend(int page) async {
  print('fetchRecommend:${baseUrl + recommendListUrl + page.toString()}');
  final response = await http.get(baseUrl + recommendListUrl + page.toString());
  return new RecommendEntity.fromJson(json.decode(response.body));
}

Future<OpEntity> fetchRecommendSearch() async {
  print('fetchRecommendSearch:${baseUrl + recommendSearchUrl}');
  final response = await http.get(baseUrl + recommendSearchUrl);
  return new OpEntity.fromJson(json.decode(response.body));
}
