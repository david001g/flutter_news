import 'package:flutter/material.dart';

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
              onTap: () {},
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
