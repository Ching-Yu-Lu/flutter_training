import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: camel_case_types
class stroeData {
  final int id;
  final String name;
  final String imgName;

  stroeData({required this.id, required this.name, required this.imgName});

  // fromJson
  factory stroeData.fromJson(Map<String, dynamic> json) {
    return stroeData(
        id: json["id"], name: json['name']['zh'], imgName: json["ImgName"]);
  }

  // fromJsonList
  static List<stroeData> fromJsonList(List<dynamic> list) {
    return list.map((e) => stroeData.fromJson(e)).toList();
  }
}

// 非同步資料提供
final storeProvider = FutureProvider<List<stroeData>>((ref) async {
  try {
    //print('==========> storeProvider');
    final data = await rootBundle.loadString('assets/json/store.json');
    final json = jsonDecode(data) as List;
    return stroeData.fromJsonList(json);
  } catch (e) {
    throw Exception('Failed to load data: $e');
  }
});
