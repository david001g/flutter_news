import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Color primary = Colors.white;
Color secondary = const Color(0xff72181c);
Color tertiary = const Color(0xff0299FF);
Color alternate = const Color(0xffe3e7ed);
Color primaryText = const Color(0xff14181b);
Color secondaryText = const Color(0xff677681);
Color primaryBackground = const Color(0xfff1f4f8);
Color secondaryBackground = const Color(0xffF7F7F7);
Color accent1 = const Color(0xff0299FF);
Color accent2 = const Color(0xffe3e7ed);
Color accent3 = const Color(0xff677681);
Color accent4 = const Color(0xff14181b);
Color success = const Color(0xff4caf50);
Color warning = const Color(0xffff9800);
Color error = const Color(0xfff44336);
Color info = const Color(0xff2196f3);

ThemeData lightTheme() {
  return ThemeData(
    primaryColor: primary,
    colorScheme: ColorScheme.light(
      primary: primary,
      secondary: secondary,
      background: primaryBackground,
      tertiary: tertiary,
      error: error,
    ),
    scaffoldBackgroundColor: primaryBackground,
    fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 8.sp,
        color: primaryText,
        fontWeight: FontWeight.bold,
      ),

      /// Text Style for the news card snippet
      bodyMedium: TextStyle(
        fontSize: 10.sp,
        color: secondaryText,
        fontWeight: FontWeight.bold,
      ),

      /// Text Style for the news card title
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        color: primaryText,
        fontWeight: FontWeight.bold,
      ),

      /// Text Style for AppBar Title
      titleLarge: TextStyle(
        fontSize: 36.sp,
        color: tertiary,
        fontWeight: FontWeight.bold,
      ),

      /// Text Style for the headline
      titleMedium: TextStyle(
        fontSize: 28.sp,
        color: primaryText,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        color: primaryText,
        fontWeight: FontWeight.bold,
      ),

      /// Text Style for the "View All"
      labelMedium: TextStyle(
        fontSize: 20.sp,
        color: tertiary,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.underline,
      ),
    ),
    iconTheme: IconThemeData(
      color: alternate,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(150.w, 50.h)),
        backgroundColor: MaterialStateProperty.all(secondary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    ),
    cardColor: secondaryBackground,
  );
}

class MyTextTheme extends TextTheme {
  final TextStyle bodyLargeContrast;
  @override
  final TextStyle titleLarge;
  @override
  final TextStyle titleMedium;
  @override
  final TextStyle labelMedium;
  @override
  final TextStyle bodyLarge;
  @override
  final TextStyle bodyMedium;
  @override
  final TextStyle bodySmall;

  const MyTextTheme(
      {required this.bodyLargeContrast,
      required this.titleLarge,
      required this.titleMedium,
      required this.labelMedium,
      required this.bodyLarge,
      required this.bodyMedium,
      required this.bodySmall})
      : super(
          titleLarge: titleLarge,
          titleMedium: titleMedium,
          labelMedium: labelMedium,
          bodyLarge: bodyLarge,
          bodyMedium: bodyMedium,
          bodySmall: bodySmall,
        );
}
