import 'package:flutter_news/src/features/presentation/pages/home/home_desktop.dart';
import 'package:flutter_news/src/features/presentation/pages/home/home_mobile.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

enum AppRoutes {
  home,
}

final goRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: AppRoutes.home.name,
    builder: (context, state) {
      if (ResponsiveBreakpoints.of(context).isMobile) {
        return const HomeMobile();
      } else {
        return const HomeDesktop();
      }
    },
    routes: [],
  ),
]);
