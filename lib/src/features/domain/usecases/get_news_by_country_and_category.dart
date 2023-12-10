import 'package:dartz/dartz.dart';
import 'package:flutter_news/src/core/error/failure.dart';
import 'package:flutter_news/src/features/domain/entities/news_entity.dart';
import 'package:flutter_news/src/features/domain/repositories/news_repository.dart';

class GetNewsByCountryAndCategory{
  final NewsRepository repository;

  GetNewsByCountryAndCategory(this.repository);

  Future<Either<Failure, NewsEntity>> execute(String country, String category) async{
    return await repository.getNewsByCountryAndCategory(country, category);
  }
}