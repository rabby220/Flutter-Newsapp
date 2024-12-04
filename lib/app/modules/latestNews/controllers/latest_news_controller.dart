import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/app/data/constant/constant.dart';
import 'package:newsapp/app/data/models/latestNewsModel.dart';

class LatestNewsController extends GetxController {
  List<LatestNewsModel> latestNewsList = [];

  Future<List<LatestNewsModel>> fetchLatestNews() async {
    try {
      final response = await http.get(Uri.parse(latestNewsUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        List<dynamic> list = body['news'];
        for (var element in list) {
          LatestNewsModel latestNewsModel = LatestNewsModel.fromJson(element);
          latestNewsList.add(latestNewsModel);
        }
        return latestNewsList;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('');
    }
  }
}
