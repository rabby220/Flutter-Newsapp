import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'app_colors.dart';

///List of Colors
List<Color> rainBowColorList = [
  AppColors.redColor,
  AppColors.orangeColor,
  AppColors.yellowColor,
  AppColors.greenColor,
  AppColors.blueColor,
  AppColors.indigoColor,
  AppColors.purpleColor,
];
Widget buildLoadingIndicator() {
  return Center(
    child: SizedBox(
      height: 70.0,
      width: 70.0,
      child: LoadingIndicator(
        indicatorType: Indicator.ballRotateChase,
        colors: rainBowColorList,
      ),
    ),
  );
}
