import 'package:flutter/material.dart';
import 'package:flutter_news/src/features/domain/entities/news_entity.dart';
import 'package:flutter_news/src/features/presentation/widgets/mobile/components/category_article.dart';

class CategoryArticleList extends StatelessWidget {
  final NewsEntity news;

  const CategoryArticleList({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        children: news.articles
            .map(
              (article) => CategoryArticle(
                title: article.title,
                description: article.description,
                image: article.urlToImage,
                url: article.url,
              ),
            )
            .toList(),
      ),
    );
  }
}

