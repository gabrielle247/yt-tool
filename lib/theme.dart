import 'package:flutter/material.dart';

// Color palette matching the HTML designs
const Color kBackgroundLight = Color(0xFFF5F6F8);
const Color kBackgroundDark = Color(0xFF101623);
const Color kSurfaceDark = Color(0xFF182234);
const Color kSurfaceCard = Color(0xFF222F49);
const Color kPrimary = Color(0xFF0D59F2);
const Color kPrimaryHover = Color(0xFF0B4ECF);
const Color kTextSecondary = Color(0xFF90A4CB);

final ThemeData cluePlayerTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: kBackgroundDark,
  primaryColor: kPrimary,
  colorScheme: const ColorScheme.dark(
    primary: kPrimary,
    secondary: Colors.blueGrey,
  onSurface: kBackgroundDark,
    surface: kSurfaceDark,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontFamily: 'Spline Sans', fontWeight: FontWeight.w900),
    displayMedium: TextStyle(fontFamily: 'Spline Sans', fontWeight: FontWeight.w700),
    displaySmall: TextStyle(fontFamily: 'Spline Sans', fontWeight: FontWeight.w600),
    headlineMedium: TextStyle(fontFamily: 'Spline Sans', fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(fontFamily: 'Spline Sans', fontWeight: FontWeight.w500),
    titleLarge: TextStyle(fontFamily: 'Spline Sans', fontWeight: FontWeight.w500),
    titleMedium: TextStyle(fontFamily: 'Spline Sans', fontWeight: FontWeight.w500),
    titleSmall: TextStyle(fontFamily: 'Spline Sans', fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontFamily: 'Noto Sans', fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(fontFamily: 'Noto Sans', fontWeight: FontWeight.w400),
    bodySmall: TextStyle(fontFamily: 'Noto Sans', fontWeight: FontWeight.w400),
    labelLarge: TextStyle(fontFamily: 'Noto Sans', fontWeight: FontWeight.w500),
    labelMedium: TextStyle(fontFamily: 'Noto Sans', fontWeight: FontWeight.w500),
    labelSmall: TextStyle(fontFamily: 'Noto Sans', fontWeight: FontWeight.w500),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: kBackgroundDark,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: kSurfaceCard),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: kPrimary),
    ),
  ),
  scrollbarTheme: ScrollbarThemeData(
    thumbVisibility: WidgetStateProperty.all(true),
    thickness: WidgetStateProperty.all(6),
    thumbColor: WidgetStateProperty.all(kPrimary.withAlpha(179)),
    radius: const Radius.circular(4),
  ),
);