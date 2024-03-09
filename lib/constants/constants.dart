import 'package:exar_copilot/view/screen_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const scaffoldBackgroundColor = Color(0xFFFAF4E8);
const primaryColor = Color(0xFF126656);
const whiteColor = Color(0xFFFFFFFF);
const blackColor = Color(0xFF151515);

double? screenWidth = Screen.screenWidth; //1440
double? screenHeight = Screen.screenHeight; //967

final textTheme = TextTheme(
  displayLarge: GoogleFonts.poppins(
    fontSize: screenWidth! / 60, //24px
    fontWeight: FontWeight.w900,
    color: blackColor,
  ),
  displayMedium: GoogleFonts.poppins(
    fontSize: screenWidth! / 65.45, //22px
    fontWeight: FontWeight.w700,
    color: blackColor,
  ),
  displaySmall: GoogleFonts.poppins(
    fontSize: screenWidth! / 80, //16px
    fontWeight: FontWeight.w900,
    color: blackColor,
  ),
  bodyLarge: GoogleFonts.poppins(
    fontSize: screenWidth! / 102.85, //14px
    fontWeight: FontWeight.w500,
    color: blackColor,
  ),
  bodyMedium: GoogleFonts.poppins(
    fontSize: screenWidth! / 110.77, //13px
    fontWeight: FontWeight.w500,
    color: blackColor,
  ),
  bodySmall: GoogleFonts.poppins(
    fontSize: screenWidth! / 120, //12px
    fontWeight: FontWeight.w500,
    color: blackColor,
  ),
  labelLarge: GoogleFonts.poppins(
    fontSize: screenWidth! / 130.9, //11px
    fontWeight: FontWeight.w500,
    color: blackColor,
  ),
);

final textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all(
        primaryColor.withOpacity(0.15),
      ),
      padding: MaterialStateProperty.all(
        EdgeInsets.zero,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth! / 96), //15
        ),
      ),
    ),
  );

final themeData = ThemeData(
  scaffoldBackgroundColor: scaffoldBackgroundColor,
  primaryColor: primaryColor,
  dividerColor: primaryColor,
  textTheme: textTheme,
  textButtonTheme: textButtonTheme,
);
