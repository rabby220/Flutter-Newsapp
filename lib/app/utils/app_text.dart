import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/app/utils/app_colors.dart';

class AppText {
  //Headline font style
  static TextStyle headLineStyle = GoogleFonts.aBeeZee(
    fontSize: 20.0,
    color: AppColors.blackColor,
  );

  static String imageNotAvailableText = "assets/image/Image_not_available.png";

  static String appBarText = "Latest News";
  static String searchBoxText = "Search News";
  static String searchButtonText = "Search";
  static String cancelButtonText = "Cancel";
}
