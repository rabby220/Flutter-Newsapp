import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/searchNewsModel.dart';

class SearchResultView extends GetView {
  final News searchNewsModel;
  const SearchResultView({super.key, required this.searchNewsModel});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        searchNewsModel.title.toString(),
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
