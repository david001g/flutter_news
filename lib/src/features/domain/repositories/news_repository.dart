import 'package:dartz/dartz.dart';
import 'package:flutter_news/src/core/error/failure.dart';
import 'package:flutter_news/src/features/domain/entities/news_entity.dart';

abstract class NewsRepository {
  Future<Either<Failure, NewsEntity>> getNews();

  Future<Either<Failure, NewsEntity>> getNewsByCategory(String category);

  Future<Either<Failure, NewsEntity>> getNewsByCountryAndCategory(String country, String category);
}
