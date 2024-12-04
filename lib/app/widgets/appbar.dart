import 'package:flutter/material.dart';

PreferredSizeWidget buildAppBarWidget({
  required String appBarText,
  required Color backgroundColor,
  List<Widget>? action,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(80),
    child: AppBar(
      title: Text(appBarText),
      backgroundColor: backgroundColor,
      centerTitle: true,
      actions: action,
    ),
  );
}
