import 'package:flutter_news/src/features/domain/entities/article_entity.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    required String? title,
    required String? description,
    required String? url,
    required String? image,
    required String? publishedAt,
  }) : super(
          title: title,
          description: description,
          url: url,
          image: image,
          publishedAt: publishedAt,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      image: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': image,
      'publishedAt': publishedAt,
    };
  }

  ArticleEntity toEntity() {
    return ArticleEntity(
      title: title,
      description: description,
      url: url,
      image: image,
      publishedAt: publishedAt,
    );
  }
}
