import 'package:flutter_news/src/features/data/models/article_model.dart';
import 'package:flutter_news/src/features/domain/entities/news_entity.dart';

class NewsModel {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  const NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> jsonArticles = json['articles'] as List<dynamic>;

    return NewsModel(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      articles: jsonArticles.map((article) => ArticleModel.fromJson(article as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> jsonArticles = articles.map((ArticleModel article) => article.toJson()).toList();

    return {
      'status': status,
      'totalResults': totalResults,
      'articles': jsonArticles,
    };
  }

  NewsEntity toEntity() {
    return NewsEntity(
      status: status,
      totalResults: totalResults,
      articles: articles.map((article) => article.toEntity()).toList(),
    );
  }
}
