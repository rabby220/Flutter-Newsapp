import 'package:flutter/material.dart';
import 'package:newsapp/app/utils/app_text.dart';

PreferredSizeWidget buildAppBarWidget({
  required String appBarText,
  required Color backgroundColor,
  List<Widget>? action,
  Widget? leadingWidget,
  bool automaticallyImplyLeading = true,
}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: AppBar(
      title: Text(appBarText),
      titleTextStyle: AppText.appBarTextStyle,
      backgroundColor: backgroundColor,
      centerTitle: true,
      actions: action,
      leading: leadingWidget,
      automaticallyImplyLeading: automaticallyImplyLeading,
    ),
  );
}
