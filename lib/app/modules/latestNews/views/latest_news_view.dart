import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:newsapp/app/modules/latestNews/controllers/latest_news_controller.dart';
import 'package:newsapp/app/utils/app_colors.dart';
import 'package:newsapp/app/utils/app_icons.dart';
import 'package:newsapp/app/utils/app_text.dart';

import '../../../utils/loading_indicator.dart';

class LatestNewsView extends GetView<LatestNewsController> {
  const LatestNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppText.appBarText),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(AppText.searchBoxText),
                        content: TextFormField(
                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z]')),
                          ],
                          controller: controller.searchController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                          ),
                        ),
                        actions: [
                          //Search Button
                          _buildAlertActionButton(
                            text: AppText.searchButtonText,
                            onPressed: () {},
                            color: AppColors.blueColor,
                          ),

                          //Cancel Button
                          _buildAlertActionButton(
                            text: AppText.cancelButtonText,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: AppIcons.searchIcon),
          ),
        ],
      ),
      // body: _buildLatestNewsData(context: context, controller: controller),
    );
  }
}

Widget _buildAlertActionButton(
    {required String text, required VoidCallback onPressed, Color? color}) {
  return MaterialButton(
    onPressed: onPressed,
    child: Text(text),
    color: color,
  );
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
