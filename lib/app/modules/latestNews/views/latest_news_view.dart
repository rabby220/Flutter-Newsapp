import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:newsapp/app/data/models/latestNewsModel.dart';
import 'package:newsapp/app/modules/latestNews/controllers/latest_news_controller.dart';
import 'package:newsapp/app/utils/app_colors.dart';
import 'package:newsapp/app/utils/app_icons.dart';
import 'package:newsapp/app/utils/app_text.dart';

import '../../../utils/loading_indicator.dart';
import '../../../widgets/appbar.dart';
import 'latest_news_screen.dart';

class LatestNewsView extends GetView<LatestNewsController> {
  const LatestNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(
        appBarText: AppText.appBarText,
        backgroundColor: AppColors.purpleColor,
        action: <Widget>[
          IconButton(
            onPressed: () {
              _buildDialogBox(context: context, controller: controller);
            },
            icon: AppIcons.searchIcon,
          )
        ],
      ),
      // body: _buildLatestNewsData(context: context, controller: controller),
    );
  }
}

//...................................................................................
//...................................................................................
//......... Here is a Alert Box
//
//...................................................................................
//...................................................................................
Future<void> _buildDialogBox({
  required BuildContext context,
  required LatestNewsController controller,
}) async {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        title: Text(AppText.searchBoxText),
        content: TextFormField(
          keyboardType: TextInputType.text,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
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
              controller.searchController.clear();
            },
          ),
        ],
      );
    },
  );
}

//...................................................................................
//...................................................................................
//......... Here is a Action button Widget
//           when user can easily search any articles or cancel click the button
//...................................................................................
//...................................................................................

Widget _buildAlertActionButton({
  required String text,
  required VoidCallback onPressed,
  Color? color,
}) {
  return MaterialButton(
    onPressed: onPressed,
    color: color,
    child: Text(text),
  );
}

//...................................................................................
//...................................................................................
//.........  This is widget of fetch data from api
//            and show will latest news data
//...................................................................................
//...................................................................................

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
              LatestNewsModel latestNewModel = controller.latestNewsList[index];
              return LatestNewsScreen(latestNewsModel: latestNewModel);
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