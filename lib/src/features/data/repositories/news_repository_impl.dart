import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_news/src/core/error/exception.dart';
import 'package:flutter_news/src/core/error/failure.dart';
import 'package:flutter_news/src/features/data/datasources/remote/remote_datasource.dart';
import 'package:flutter_news/src/features/domain/entities/news_entity.dart';
import 'package:flutter_news/src/features/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoryImpl({required this.newsRemoteDataSource});

  @override
  Future<Either<Failure, NewsEntity>> getNews() async {
    try {
      final result = await newsRemoteDataSource.getNews();
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, NewsEntity>> getNewsByCategory(String category) async {
    try {
      final result = await newsRemoteDataSource.getNewsByCategory(category);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, NewsEntity>> getNewsByCountryAndCategory(String country, String category) async {
    try {
      final result = await newsRemoteDataSource.getNewsByCountryAndCategory(country, category);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
