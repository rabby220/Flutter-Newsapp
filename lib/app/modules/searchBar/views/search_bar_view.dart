import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_text.dart';
import '../controllers/search_bar_controller.dart';

class SearchBarView extends GetView<SearchBarController> {
  const SearchBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(AppText.searchBoxText),
              content: TextFormField(
                keyboardType: TextInputType.text,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                ],
                controller: controller.searchTextEditingController,
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
      icon: AppIcons.searchIcon,
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
