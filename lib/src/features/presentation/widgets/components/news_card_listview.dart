import 'package:flutter/material.dart';
import 'package:flutter_news/src/features/domain/entities/news_entity.dart';
import 'package:flutter_news/src/features/presentation/widgets/components/news_card.dart';

class NewsCardListview extends StatelessWidget {
  final NewsEntity news;
  const NewsCardListview({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: news.articles.reversed.map((e) => NewsCard(title: e.title, image: e.urlToImage, url: e.url, description:  e.description)).toList(),
    );
  }
}
