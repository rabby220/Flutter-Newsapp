import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/app/utils/app_colors.dart';

class AppText {
  static TextStyle headlinesTextStyle = GoogleFonts.merriweather(
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );

  static TextStyle titleTextStyle = GoogleFonts.merriweather(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );

  static TextStyle descriptionTextStyle = GoogleFonts.playfairDisplay(
      fontSize: 20.0, color: AppColors.blackColor, fontWeight: FontWeight.w600);

  static TextStyle readmeTextStyle = GoogleFonts.poppins(
    fontSize: 14.0,

    //color: AppColors.blackColor,
    fontWeight: FontWeight.bold,
    color: Colors.blueAccent,
  );

  static TextStyle subTitleBoldTextStyle = GoogleFonts.aBeeZee(
    fontSize: 12.0,
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subTitleNormalTextStyle = GoogleFonts.aBeeZee(
    fontSize: 10.0,
    color: AppColors.blackColor,
  );

  static String imageNotAvailableText = "assets/image/Image_not_available.png";

  static String appBarText = "Latest News";
  static String searchBoxText = "Search News";
  static String searchButtonText = "Search";
  static String cancelButtonText = "Cancel";
}
