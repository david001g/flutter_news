import 'package:flutter_news/src/features/presentation/pages/home/home_desktop.dart';
import 'package:flutter_news/src/features/presentation/pages/home/home_mobile.dart';
import 'package:flutter_news/src/features/presentation/pages/home/home_tablet.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

enum AppRoutes {
  home,
}

final goRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: AppRoutes.home.name,
    builder: (context, state)  {
      if(ResponsiveBreakpoints.of(context).smallerThan('Small')) {
        return const HomeMobile();
      } else if(ResponsiveBreakpoints.of(context).smallerThan('Medium')) {
        return const HomeTablet();
      } else {
        return const HomeDesktop();
      }
    },
    routes: [
    ],
  ),
]);
