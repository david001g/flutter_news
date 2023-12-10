import 'package:flutter/material.dart';
import 'package:flutter_news/src/core/constants/constants.dart';
import 'package:flutter_news/src/features/presentation/widgets/components/category_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CategoryListview extends StatelessWidget {
  const CategoryListview({super.key});

  @override
  Widget build(BuildContext context) {
    final double gapValue = 30.w;
    return Container(
      height: 90.h,
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
      child: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            const CategoryItem(title: 'Business', image: CategoryImages.business),
            Gap(gapValue),
            const CategoryItem(title: 'Entertainment', image: CategoryImages.entertainment),
            Gap(gapValue),
            const CategoryItem(title: 'General', image: CategoryImages.general),
            Gap(gapValue),
            const CategoryItem(title: 'Health', image: CategoryImages.health),
            Gap(gapValue),
            const CategoryItem(title: 'Science', image: CategoryImages.science),
            Gap(gapValue),
            const CategoryItem(title: 'Sports', image: CategoryImages.sports),
            Gap(gapValue),
            const CategoryItem(title: 'Technology', image: CategoryImages.technology),
            Gap(gapValue),
            const CategoryItem(title: 'Politics', image: CategoryImages.politics),
            Gap(gapValue),
            const CategoryItem(title: 'Food', image: CategoryImages.food),
            Gap(gapValue),
            const CategoryItem(title: 'Travel', image: CategoryImages.travel),
          ],
        ),
      ),
    );
  }
}
