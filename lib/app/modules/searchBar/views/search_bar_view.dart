import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/app/modules/searchBar/views/search_result_view.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/loading_indicator.dart';
import '../../../widgets/appbar.dart';
import '../controllers/search_bar_controller.dart';

class SearchBarView extends GetView<SearchBarController> {
  const SearchBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(
          appBarText: 'search',
          backgroundColor: AppColors.purpleColor,
          leadingWidget: IconButton(
            onPressed: () {
              Get.offNamed('/latest-news');
            },
            icon: Icon(Icons.arrow_back_sharp),
          )),
      body: _buildSearchNews(controller: controller, context: context),
    );
  }
}

Widget _buildSearchNews({
  required SearchBarController controller,
  required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: FutureBuilder(
      future: controller.searchNewsData(searchQuery: 'Apple macbook'),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            itemCount: controller.searchNewsList.length,
            itemBuilder: (_, index) {
              final searchNewsModel = controller.searchNewsList[index];
              return SearchResultView(searchNewsModel: searchNewsModel);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: AppColors.blackColor,
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        } else {
          return buildLoadingIndicator();
        }
      },
    ),
  );
}
