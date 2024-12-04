import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/app/modules/latestNews/controllers/latest_news_controller.dart';

import '../../../utils/loading_indicator.dart';

class LatestNewsView extends GetView<LatestNewsController> {
  const LatestNewsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest News'),
        centerTitle: true,
      ),
      body: _buildLatestNewsData(context: context, controller: controller),
    );
  }
}

Widget _buildLatestNewsData({
  required LatestNewsController controller,
  required BuildContext context,
}) {
  return FutureBuilder(
    future: controller.fetchLatestNews(),
    builder: (_, snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(
          itemCount: controller.latestNewsList.length,
          itemBuilder: (_, index) {
            final data = controller.latestNewsList[index];
            return ListTile(
              title: Text(data!.title!.toString()),
            );
          },
        );
      }
      return buildLoadingIndicator();
    },
  );
}
