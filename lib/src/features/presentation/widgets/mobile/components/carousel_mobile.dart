import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/src/features/domain/entities/news_entity.dart';
import 'package:flutter_news/src/features/presentation/widgets/mobile/components/news_item_mobile.dart';

class CarouselMobile extends StatelessWidget {
  final NewsEntity news;

  const CarouselMobile({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ),
        items: news.articles
            .map(
              (e) => NewsItemMobile(
                title: e.title,
                image: e.urlToImage,
                url: e.url,
              ),
            )
            .toList());
  }
}
