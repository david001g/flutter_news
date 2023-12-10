import 'package:dartz/dartz.dart';
import 'package:flutter_news/src/core/error/failure.dart';
import 'package:flutter_news/src/features/domain/entities/news_entity.dart';
import 'package:flutter_news/src/features/domain/repositories/news_repository.dart';

class GetNews{
  final NewsRepository repository;

  GetNews(this.repository);

  Future<Either<Failure, NewsEntity>> execute() async{
    return await repository.getNews();
  }
}