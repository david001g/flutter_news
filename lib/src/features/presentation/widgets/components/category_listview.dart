import 'package:flutter/material.dart';
import 'package:flutter_news/src/core/constants/constants.dart';
import 'package:flutter_news/src/features/presentation/widgets/components/category_item.dart';
import 'package:gap/gap.dart';

class CategoryListview extends StatelessWidget {
  const CategoryListview({super.key});

  @override
  Widget build(BuildContext context) {
    const double gapValue = 30;
    return Container(
      height: 90,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Center(
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: const [
            CategoryItem(title: 'Business', image: CategoryImages.business),
            Gap(gapValue),
            CategoryItem(title: 'Entertainment', image: CategoryImages.entertainment),
            Gap(gapValue),
            CategoryItem(title: 'Technology', image: CategoryImages.technology),
            Gap(gapValue),
            CategoryItem(title: 'Health', image: CategoryImages.health),
            Gap(gapValue),
            CategoryItem(title: 'Science', image: CategoryImages.science),
            Gap(gapValue),
            CategoryItem(title: 'Sports', image: CategoryImages.sports),
            Gap(gapValue),
            CategoryItem(title: 'Other', image: CategoryImages.general),
          ],
        ),
      ),
    );
  }
}
