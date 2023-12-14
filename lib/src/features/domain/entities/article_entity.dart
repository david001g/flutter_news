import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final String? title;
  final String? description;
  final String? url;
  final String? image;
  final String? publishedAt;

  const ArticleEntity({
    required this.title,
    required this.description,
    required this.url,
    required this.image,
    required this.publishedAt,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        url,
        image,
        publishedAt,
      ];

  @override
  String toString() {
    return 'ArticleEntity{title: $title, description: $description, url: $url, urlToImage: $image, publishedAt: $publishedAt}';
  }
}
