import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../data/models/latestNewsModel.dart';
import '../utils/app_text.dart';
import '../utils/loading_indicator.dart';

Widget buildCachedImageWidget({
  required LatestNewsModel latestNewsModel,
}) {
  return CachedNetworkImage(
    height: 300,
    alignment: Alignment.center,
    width: double.infinity,
    colorBlendMode: BlendMode.clear, fadeInCurve: Curves.easeIn,
    fadeOutCurve: Curves.easeOut,

    errorWidget: (context, url, error) => Image.asset(
      AppText.imageNotAvailableText, // Local fallback image
      fit: BoxFit.cover,
    ),
    placeholder: (context, url) => buildLoadingIndicator(), // Loading indicator
    imageUrl: (latestNewsModel.image == "None" || latestNewsModel.image == "")
        ? AppText.imageNotAvailableText // Local placeholder image when "None"
        : latestNewsModel.image.toString(), // Use valid URL if available
  );
}
