import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String image;

  const CategoryItem({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    final double titleSmall;

    return SizedBox(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: 170,
              height: 100,
            ),
          ),
          Container(
            width: 170,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.3),
            ),
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
