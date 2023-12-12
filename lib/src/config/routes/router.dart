import 'package:flutter_news/src/common/error_page.dart';
import 'package:flutter_news/src/features/presentation/pages/article/article_view.dart';
import 'package:flutter_news/src/features/presentation/pages/category/category_desktop.dart';
import 'package:flutter_news/src/features/presentation/pages/category/category_mobile.dart';
import 'package:flutter_news/src/features/presentation/pages/home/home_desktop.dart';
import 'package:flutter_news/src/features/presentation/pages/home/home_mobile.dart';
import 'package:flutter_news/src/features/presentation/pages/top_news/top_news_desktop.dart';
import 'package:flutter_news/src/features/presentation/pages/top_news/top_news_mobile.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

enum AppRoutes {
  home,
  category,
  article,
  error,
  topNews,
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
    routes: [
      GoRoute(
        path: 'category/:categoryName',
        name: AppRoutes.category.name,
        builder: (context, state) {
          if (ResponsiveBreakpoints.of(context).isMobile) {
            return CategoryMobile(categoryName: state.pathParameters['categoryName']!);
          } else {
            return CategoryDesktop(categoryName: state.pathParameters['categoryName']!);
          }
        },
      ),
      GoRoute(
        path: 'article/:articleUrl',
        name: AppRoutes.article.name,
        builder: (context, state) {
          return ArticleView(url: state.pathParameters['articleUrl']!);
        },
      ),
      GoRoute(
        path: 'top-news',
        name: AppRoutes.topNews.name,
        builder: (context, state) {
          if (ResponsiveBreakpoints.of(context).isMobile) {
            return const TopNewsMobile();
          } else {
            return const TopNewsDesktop();
          }
        },
      ),
      GoRoute(
        path: 'error',
        name: AppRoutes.error.name,
        builder: (context, state) => const ErrorPage(),
      )
    ],
  ),
], errorBuilder: (context, state) => const ErrorPage());
