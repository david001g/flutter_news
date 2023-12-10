import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme() {
  Color primary = Colors.white;
  Color secondary = const Color(0xff72181c);
  Color tertiary = const Color(0xff0299FF);
  Color alternate = const Color(0xffe3e7ed);
  Color primaryText = const Color(0xff14181b);
  Color secondaryText = const Color(0xff677681);
  Color primaryBackground = const Color(0xfff1f4f8);
  Color secondaryBackground = const Color(0xffffffff);
  Color accent1 = const Color(0xff0299FF);
  Color accent2 = const Color(0xffe3e7ed);
  Color accent3 = const Color(0xff677681);
  Color accent4 = const Color(0xff14181b);
  Color success = const Color(0xff4caf50);
  Color warning = const Color(0xffff9800);
  Color error = const Color(0xfff44336);
  Color info = const Color(0xff2196f3);
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
        fontSize: 14.sp,
        color: primaryText,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 20.sp,
        color: primaryText,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 60.sp,
        color: primaryText,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 20.sp,
        color: primaryText,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        color: primaryText,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        fontSize: 20.sp,
        color: primaryText,
        fontWeight: FontWeight.bold,
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
  );
}
