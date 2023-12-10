import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/src/config/routes/router.dart';
import 'package:flutter_news/src/config/themes/dark_theme.dart';
import 'package:flutter_news/src/config/themes/light_theme.dart';
import 'package:flutter_news/src/features/presentation/bloc/news_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NewsCubit>().loadNews();
    return ScreenUtilInit(
      designSize: const Size(1440, 1024),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => MaterialApp.router(
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.mouse},
        ),
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 576, name: 'X-Small'),
            const Breakpoint(start: 576, end: 768, name: 'Small'),
            const Breakpoint(start: 768, end: 992, name: 'Medium'),
            const Breakpoint(start: 992, end: 1200, name: 'Large'),
            const Breakpoint(start: 1200, end: 1400, name: 'ExtraLarge'),
            const Breakpoint(start: 1400, end: double.infinity, name: 'ExtraExtraLarge'),
          ],
        ),
        themeMode: ThemeMode.light,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        routerConfig: goRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
