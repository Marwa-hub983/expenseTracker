
import 'package:expense_trackerapp/shared/themes/font_palette.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: kprimaryColor),
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    
    brightness: Brightness.light,
    scaffoldBackgroundColor: kWhite,
    appBarTheme: AppBarTheme(
        elevation: 0,
    centerTitle: true,
      backgroundColor: kPrimaryColor1,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: FontPalette.hW700S23.copyWith(color: kBlack),
      iconTheme: IconThemeData(color: kprimaryColor),
    ),
    canvasColor: kSecondaryColor1,

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: kWhite,
      labelStyle: TextStyle(color: kBlack.withOpacity(0.8)),
      errorStyle: const TextStyle(color: kRedColor),
      errorMaxLines: 5,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          style: BorderStyle.solid,
          color: kSecondaryColor3,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          style: BorderStyle.solid,
          color: kRedColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(style: BorderStyle.solid, color: kprimaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(style: BorderStyle.solid, color: kprimaryColor),
      ),
    ),
    textTheme: FontPalette.textLightTheme,
    primaryTextTheme: FontPalette.textLightTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(kprimaryColor),
        foregroundColor: WidgetStateProperty.all<Color>(kWhite),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    ),
    iconTheme: IconThemeData(color: kBlack),
    fontFamily: FontPalette.themeFont,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kWhite,
    ),
  );
 static ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: kprimaryColor,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
  brightness: Brightness.dark,


  scaffoldBackgroundColor: kBlack,
  canvasColor: Colors.grey[900],


  cardColor: Colors.grey[900],
iconTheme: IconThemeData(color: kWhite),
  appBarTheme: AppBarTheme(
    backgroundColor: kPrimaryColor1,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: FontPalette.hW700S23.copyWith(color: kWhite),
    iconTheme: IconThemeData(color: kprimaryColor),
  ),


  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[850], 
    labelStyle: TextStyle(color: kWhite.withOpacity(0.8)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade700),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: kprimaryColor),
    ),
  ),

  textTheme: FontPalette.textDarkTheme,
  primaryTextTheme: FontPalette.textDarkTheme,

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(kprimaryColor),
      foregroundColor: WidgetStateProperty.all(kWhite),
    ),
  ),


  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[900],
  ),
);
}
