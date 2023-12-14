import 'package:flutter_news/src/features/data/models/article_model.dart';
import 'package:flutter_news/src/features/domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  NewsModel({
    required String status,
    required int totalResults,
    required List<ArticleModel> articles,
  }) : super(
          status: status,
          totalResults: totalResults,
          articles: articles.map((article) => article.toEntity()).toList(),
        );

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> jsonArticles = json['articles'] as List<dynamic>;

    return NewsModel(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      articles: jsonArticles.map((article) => ArticleModel.fromJson(article as Map<String, dynamic>)).toList(),
    );
  }

  NewsEntity toEntity() {
    return NewsEntity(
      status: status,
      totalResults: totalResults,
      articles: articles,
    );
  }
}
