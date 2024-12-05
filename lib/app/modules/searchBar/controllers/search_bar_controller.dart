import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/constant/constant.dart';
import '../../../data/models/searchNewsModel.dart';

class SearchBarController extends GetxController {
  final TextEditingController searchTextEditingController =
      TextEditingController();

  List<News> SearchNewsList = [];
  Future<List<News>> searchNewsData({required String searchQuery}) async {
    final String url = "$searchUrl$searchQuery&apiKey=$apiKey";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        List<dynamic> list = body['news'];
        for (var element in list) {
          News searchNewsModel = News.fromJson(element);
          SearchNewsList.add(searchNewsModel);
        }
        return SearchNewsList;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('');
    }
  }
}
