import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

Widget IconButtonWidget({
  required VoidCallback onPressed,
  required Widget icon,
  required String tooltip,
}) {
  return IconButton.outlined(
    onPressed: onPressed,
    icon: icon,
    padding: const EdgeInsets.all(5.0),
    tooltip: tooltip,
    splashColor: AppColors.blueColor,
    color: AppColors.blackColor,
    iconSize: 20.0,
  );
}
