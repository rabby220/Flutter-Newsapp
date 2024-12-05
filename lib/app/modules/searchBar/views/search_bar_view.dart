import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/app/modules/searchBar/views/search_result_view.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/loading_indicator.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/iconButton.dart';
import '../controllers/search_bar_controller.dart';

class SearchBarView extends GetView<SearchBarController> {
  const SearchBarView({super.key});
  @override
  Widget build(BuildContext context) {
    final String searchText = Get.arguments ?? '';
    return Scaffold(
      appBar: buildAppBarWidget(
        appBarText: 'search results',
        backgroundColor: AppColors.greenColor,
        leadingWidget: IconButtonWidget(
          onPressed: () {
            Get.back();
            // Get.offNamed('/latest-news');
          },
          icon: AppIcons.arrowBackIcon,
          tooltip: 'Back',
        ),
      ),
      body: _buildSearchNews(
        controller: controller,
        context: context,
        searchText: searchText,
        //  searchText: searchText.toString(),
      ),
    );
  }
}

Widget _buildSearchNews({
  required SearchBarController controller,
  required BuildContext context,
  required String searchText,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: FutureBuilder(
      future: controller.searchNewsData(searchQuery: searchText),
      builder: (_, snapshot) {
        // Show loading indicator while the future is running
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildLoadingIndicator();
        }

        // Handle errors
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error.toString()}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        // Show "No results" if the list is empty
        if (snapshot.connectionState == ConnectionState.done &&
            controller.searchNewsList.isEmpty) {
          return Center(
            child: Text('No results found for "$searchText"'),
          );
        }

        // Show the search results
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
        }

        // Default case (shouldn't be reached)
        return const SizedBox();
      },
    ),
  );
}
