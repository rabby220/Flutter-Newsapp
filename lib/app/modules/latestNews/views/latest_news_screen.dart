import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/app/data/models/latestNewsModel.dart';

import '../../../utils/app_text.dart';
import '../../../widgets/cacheImage.dart';
import 'news_details_screen.dart';

class LatestNewsScreen extends GetView {
  final LatestNewsModel latestNewsModel;
  const LatestNewsScreen({super.key, required this.latestNewsModel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => NewsDetailsScreen(
            latestNewsModel: latestNewsModel,
          ),
        );
      },
      child: ListTile(
        subtitle: Text(
          latestNewsModel.title.toString(),
          style: AppText.headlinesTextStyle,
          textAlign: TextAlign.justify,
        ),
        title: _buildImageWidget(latestNewsModel: latestNewsModel),
      ),
    );
  }
}

//----------------------------------------------------------------
//----------------------------------------------------------------
//----------------------------------------------------------------
// This Widget User for image and title when user open the appp show will latest news here...
Widget _buildImageWidget({
  required LatestNewsModel latestNewsModel,
}) {
  return buildCachedImageWidget(latestNewsModel: latestNewsModel);
}
