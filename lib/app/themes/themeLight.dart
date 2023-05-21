import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oneloc_use_case/app/colorConstants.dart';
import 'package:oneloc_use_case/app/paddingConstants.dart';

ThemeData themeLight = ThemeData.dark().copyWith(
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: ColorConstants.blueColor,
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: ColorConstants.blackColor,
      error: ColorConstants.redColor,
      onError: Colors.white,
      background: ColorConstants.greyColor,
      onBackground: ColorConstants.whiteColor,
      surface: ColorConstants.whiteColorAccent,
      onSurface: ColorConstants.greyColor2
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.roboto(
        color: ColorConstants.whiteColor,
        fontSize: 35
    ),
    titleMedium: GoogleFonts.roboto(
        color: ColorConstants.blackColor,
        fontSize: 26
    ),
    bodyLarge: GoogleFonts.roboto(
      color: ColorConstants.orangeColor,
      fontSize: 35,
    ),
    bodySmall: GoogleFonts.roboto(
      color: ColorConstants.blackColor,
      fontSize: 12,
    ),
    bodyMedium: GoogleFonts.roboto(
        color: ColorConstants.blueColor,
        fontSize: 18,
        fontWeight: FontWeight.bold
    ),
  ),
  appBarTheme: AppBarTheme(
      color: ColorConstants.whiteColor,
      centerTitle: true,
      titleTextStyle: GoogleFonts.roboto(
          color: ColorConstants.blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 18
      ),
      elevation: 0,
      iconTheme: IconThemeData(
          color: ColorConstants.blueColor
      )
  ),
  iconTheme: IconThemeData(
    color: ColorConstants.blackColor
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: GoogleFonts.roboto(
      color: ColorConstants.greyColor2,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    filled: true,
    contentPadding: PaddingConstants().allMedium,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
            color: ColorConstants.redColor,
            width: 3
        )
    ),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
            color: ColorConstants.redColor,
            width: 3
        )
    ),
  ),
);