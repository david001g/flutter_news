import 'package:dartz/dartz.dart';
import 'package:flutter_news/src/core/error/failure.dart';
import 'package:flutter_news/src/features/domain/entities/news_entity.dart';
import 'package:flutter_news/src/features/domain/repositories/news_repository.dart';

class GetNewsByCategory{
  final NewsRepository newsRepository;

  GetNewsByCategory(this.newsRepository);

  Future<Either<Failure, NewsEntity>> execute(String country) async{
    return await newsRepository.getNewsByCategory(country);
  }
}