import 'dart:async';
import 'dart:convert';

import 'package:flutter_ipanda/entity/tab_entity.dart';
import 'package:flutter_ipanda/net/api.dart';
import 'package:http/http.dart' as http;

Future<TabEntity> fetchTab() async {
  print('fetchOp:${baseUrl + type + tabUrl}');
  final response = await http.get(baseUrl + type + tabUrl);
  return TabEntity.fromJson(json.decode(response.body));
}
