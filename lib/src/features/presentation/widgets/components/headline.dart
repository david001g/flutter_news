import 'package:flutter/material.dart';
import 'package:flutter_news/src/config/routes/router.dart';
import 'package:go_router/go_router.dart';

class HeadLine extends StatelessWidget {
  final String title;

  const HeadLine({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => context.pushNamed(AppRoutes.topNews.name),
              child: Text(
                'View All',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
