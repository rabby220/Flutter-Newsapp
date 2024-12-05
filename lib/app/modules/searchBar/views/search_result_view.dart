import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/app/data/models/latestNewsModel.dart';
import 'package:newsapp/app/modules/searchBar/views/search_news_details_view.dart';

import '../../../utils/app_text.dart';
import '../../../widgets/cacheImage.dart';

class SearchResultView extends GetView {
  final LatestNewsModel searchNewsModel;
  const SearchResultView({super.key, required this.searchNewsModel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => SearchNewsDetailsScreen(
            latestNewsModel: searchNewsModel,
          ),
        );
      },
      child: ListTile(
        subtitle: buildCachedImageWidget(latestNewsModel: searchNewsModel),
        title: Text(
          searchNewsModel.title.toString(),
          style: AppText.headlinesTextStyle,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
