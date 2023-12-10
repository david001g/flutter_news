import 'package:equatable/equatable.dart';
import 'package:flutter_news/src/features/domain/entities/article_entity.dart';

class NewsEntity extends Equatable{
  final String status;
  final int totalResults;
  final List<ArticleEntity> articles;

  const NewsEntity({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  @override
  List<Object?> get props => [
    status,
    totalResults,
    articles,
  ];

  @override
  String toString() {
    return 'NewsEntity{status: $status, totalResults: $totalResults, articles: $articles}';
  }
}