import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/app/data/models/latestNewsModel.dart';

import '../../../utils/app_text.dart';
import '../../../utils/loading_indicator.dart';
import 'news_details_screen.dart';

class LatestNewsScreen extends GetView {
  final LatestNewsModel latestNewsModel;
  const LatestNewsScreen({super.key, required this.latestNewsModel});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(
        latestNewsModel.title.toString(),
        style: AppText.headlinesTextStyle,
        textAlign: TextAlign.justify,
      ),
      title: _buildImageWidget(latestNewsModel: latestNewsModel),
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
  return GestureDetector(
    onTap: () {
      Get.to(
        () => NewsDetailsScreen(
          latestNewsModel: latestNewsModel,
        ),
      );
    },
    child: CachedNetworkImage(
      errorWidget: (context, url, error) => Image.asset(
        AppText.imageNotAvailableText,
        fit: BoxFit.cover,
      ),
      placeholder: (context, url) => buildLoadingIndicator(),
      imageUrl: latestNewsModel.image == "None"
          ? ''
          : latestNewsModel.image.toString(),
    ),
  );
}
