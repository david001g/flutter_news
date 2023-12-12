import 'package:flutter/material.dart';
import 'package:flutter_news/src/config/routes/router.dart';
import 'package:flutter_news/src/config/themes/light_theme.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter News',
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 800, name: MOBILE),
          const Breakpoint(start: 801, end: double.infinity, name: DESKTOP),
        ],
      ),
      themeMode: ThemeMode.light,
      theme: lightTheme(),
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
