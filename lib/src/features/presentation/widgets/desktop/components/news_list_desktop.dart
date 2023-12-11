import 'package:flutter/material.dart';
import 'package:flutter_news/src/features/domain/entities/news_entity.dart';
import 'package:flutter_news/src/features/presentation/widgets/mobile/components/news_item_mobile.dart';
import 'package:flutter_news/src/features/presentation/widgets/desktop/components/news_item_desktop.dart';
import 'package:gap/gap.dart';

class NewsListDesktop extends StatelessWidget {
  final NewsEntity news;

  const NewsListDesktop({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: SizedBox(
        height: 200,
        child: ListView(scrollDirection: Axis.horizontal, shrinkWrap: true, children: [
          NewsItemDesktop(title: news.articles[0].title, image: news.articles[0].urlToImage, url: news.articles[0].url),
          const Gap(10),
          NewsItemDesktop(title: news.articles[1].title, image: news.articles[1].urlToImage, url: news.articles[1].url),
          const Gap(10),
          NewsItemDesktop(title: news.articles[2].title, image: news.articles[2].urlToImage, url: news.articles[2].url),
          const Gap(10),
          NewsItemDesktop(title: news.articles[3].title, image: news.articles[3].urlToImage, url: news.articles[3].url),
          const Gap(10),
          NewsItemDesktop(title: news.articles[4].title, image: news.articles[4].urlToImage, url: news.articles[4].url),
          const Gap(10),
          NewsItemDesktop(title: news.articles[5].title, image: news.articles[5].urlToImage, url: news.articles[5].url),
        ]),
      ),
    );
  }
}
