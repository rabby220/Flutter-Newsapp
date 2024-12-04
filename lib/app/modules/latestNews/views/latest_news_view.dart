import 'package:cached_network_image/cached_network_image.dart';
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
        toolbarHeight: 90.0,
        backgroundColor: AppColors.purpleColor,
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
      body: _buildLatestNewsData(context: context, controller: controller),
    );
  }
}

//this is a action button when user can search any articles or can cancel search box
Widget _buildAlertActionButton(
    {required String text, required VoidCallback onPressed, Color? color}) {
  return MaterialButton(
    onPressed: onPressed,
    child: Text(text),
    color: color,
  );
}

//This is widget of fetch data from api show will latest news data...
Widget _buildLatestNewsData({
  required LatestNewsController controller,
  required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: FutureBuilder(
      future: controller.fetchLatestNews(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            itemCount: controller.latestNewsList.length,
            itemBuilder: (_, index) {
              final data = controller.latestNewsList[index];
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        color: Colors.red,
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width,
                      );
                    },
                  );
                },
                child: ListTile(
                  subtitle: Text(
                    data.title.toString(),
                    style: AppText.headLineStyle,
                  ),
                  title: CachedNetworkImage(
                    errorWidget: (context, url, error) => Image.asset(
                      AppText.imageNotAvailableText,
                      fit: BoxFit.cover,
                    ),
                    placeholder: (context, url) => buildLoadingIndicator(),
                    imageUrl: data.image == "None" ? '' : data.image.toString(),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.black,
              );
            },
          );
        }
        return buildLoadingIndicator();
      },
    ),
  );
}
