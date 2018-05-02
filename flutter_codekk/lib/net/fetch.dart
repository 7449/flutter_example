import 'dart:async';
import 'dart:convert';

import 'package:flutter_codekk/entity/op_entity.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:http/http.dart' as http;

const opType = ['array', 'map', 'mix'];

///http://api.codekk.com/op/page/1?type=array
Future<OpEntity> fetchOp(int page, String type) async {
  final response = await http.get(baseUrl + opListUrl + page.toString());
  return new OpEntity.fromJson(json.decode(response.body));
}
