import 'dart:async';
import 'dart:convert';

import 'package:flutter_codekk/entity/op_entity.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:http/http.dart' as http;

const opType = ['array', 'map', 'mix'];

Future<OpEntity> fetchOp(int page, String type) async {
  final response = await http.get(baseUrl + opListUrl + page.toString());
  return OpEntity.fromJson(json.decode(response.body));
}
