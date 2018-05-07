import 'dart:async';
import 'dart:convert';

import 'package:flutter_codekk/entity/blog_entity.dart';
import 'package:flutter_codekk/entity/job_entity.dart';
import 'package:flutter_codekk/entity/op_entity.dart';
import 'package:flutter_codekk/entity/op_search_entity.dart';
import 'package:flutter_codekk/entity/opa_entity.dart';
import 'package:flutter_codekk/entity/opa_search_entity.dart';
import 'package:flutter_codekk/entity/readme_entity.dart';
import 'package:flutter_codekk/entity/recommend_entity.dart';
import 'package:flutter_codekk/entity/recommend_search_entity.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:http/http.dart' as http;

const opType = ['array', 'map', 'mix'];

///http://api.codekk.com/op/page/1?type=array
Future<OpEntity> fetchOp(int page, String type) async {
  print('fetchOp:${baseUrl + opListUrl + page.toString()}');
  final response = await http.get(baseUrl + opListUrl + page.toString());
  return new OpEntity.fromJson(json.decode(response.body));
}

///http://api.codekk.com/op/search?text=rxjava&page=1
Future<OpSearchEntity> fetchOpSearch(String search, int page) async {
  print('fetchOpSearch:${baseUrl + opSearchUrl + search + '&page=' +
      page.toString()}');
  final response = await http
      .get(baseUrl + opSearchUrl + search + '&page=' + page.toString());
  return new OpSearchEntity.fromJson(json.decode(response.body));
}

///http://api.codekk.com/opa/page/1
Future<OpaEntity> fetchOpa(int page) async {
  print('fetchOpa:${baseUrl + opaListUrl + page.toString()}');
  final response = await http.get(baseUrl + opaListUrl + page.toString());
  return new OpaEntity.fromJson(json.decode(response.body));
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

///详情网络请求
Future<ReadmeEntity> fetchReadme(ApiType apiType, String id) async {
  String url = '';
  switch (apiType) {
    case ApiType.RECOMMEND:
      url = id;
      break;
    default:
      url = baseUrl + readmeUrl(apiType, id);
      break;
  }
  print('fetchReadme:$url');
  final response = await http.get(url);
  return new ReadmeEntity.fromJson(json.decode(response.body));
}

///http://api.codekk.com/recommend/page/1
Future<RecommendEntity> fetchRecommend(int page) async {
  print('fetchRecommend:${baseUrl + recommendListUrl + page.toString()}');
  final response = await http.get(baseUrl + recommendListUrl + page.toString());
  return new RecommendEntity.fromJson(json.decode(response.body));
}

///http://api.codekk.com/recommend/user/yy/page/1
Future<RecommendSearchEntity> fetchRecommendSearch(
    String search, int page) async {
  print(
      'fetchRecommendSearch:${baseUrl + recommendSearchUrl + search + '/page/' +
          page.toString()}');
  final response = await http
      .get(baseUrl + recommendSearchUrl + search + '/page/' + page.toString());
  return new RecommendSearchEntity.fromJson(json.decode(response.body));
}
