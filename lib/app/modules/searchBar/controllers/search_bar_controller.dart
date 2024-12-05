import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/constant/constant.dart';
import '../../../data/models/latestNewsModel.dart';

class SearchBarController extends GetxController {
  final TextEditingController searchTextEditingController =
      TextEditingController();

  List<LatestNewsModel> searchNewsList = [];
  Future<List<LatestNewsModel>> searchNewsData(
      {required String searchQuery}) async {
    final String url = "$searchUrl$searchQuery&apiKey=$apiKey";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        List<dynamic> list = body['news'];
        for (var element in list) {
          LatestNewsModel searchNewsModel = LatestNewsModel.fromJson(element);
          searchNewsList.add(searchNewsModel);
        }
        return searchNewsList;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('');
    }
  }
}
