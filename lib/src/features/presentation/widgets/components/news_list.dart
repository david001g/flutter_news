import 'package:flutter/material.dart';
import 'package:flutter_news/src/features/domain/entities/news_entity.dart';
import 'package:flutter_news/src/features/presentation/widgets/mobile/components/news_item_mobile.dart';

class NewsList extends StatelessWidget {
  final NewsEntity news;

  const NewsList({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        NewsItemMobile(title: news.articles[0].title, image: news.articles[0].urlToImage, url: news.articles[0].url),
        NewsItemMobile(title: news.articles[1].title, image: news.articles[1].urlToImage, url: news.articles[1].url),
        NewsItemMobile(title: news.articles[2].title, image: news.articles[2].urlToImage, url: news.articles[2].url),
        NewsItemMobile(title: news.articles[3].title, image: news.articles[3].urlToImage, url: news.articles[3].url),
        NewsItemMobile(title: news.articles[4].title, image: news.articles[4].urlToImage, url: news.articles[4].url),
        NewsItemMobile(title: news.articles[5].title, image: news.articles[5].urlToImage, url: news.articles[5].url),
      ]),
    );
  }
}
