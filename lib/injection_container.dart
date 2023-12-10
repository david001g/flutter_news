import 'package:flutter_news/src/features/data/datasources/remote/remote_datasource.dart';
import 'package:flutter_news/src/features/data/datasources/remote/remote_datasource_impl.dart';
import 'package:flutter_news/src/features/data/repositories/news_repository_impl.dart';
import 'package:flutter_news/src/features/domain/repositories/news_repository.dart';
import 'package:flutter_news/src/features/domain/usecases/get_news.dart';
import 'package:flutter_news/src/features/domain/usecases/get_news_by_category.dart';
import 'package:flutter_news/src/features/domain/usecases/get_news_by_country_and_category.dart';
import 'package:flutter_news/src/features/presentation/bloc/news_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void setupLocator() {
  /// cubit
  locator.registerFactory(() => NewsCubit(locator(), locator(), locator()));

  /// use cases
  locator.registerLazySingleton(() => GetNews(locator()));
  locator.registerLazySingleton(() => GetNewsByCategory(locator()));
  locator.registerLazySingleton(() => GetNewsByCountryAndCategory(locator()));

  /// repositories
  locator.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(newsRemoteDataSource: locator()));

  /// data sources
  locator.registerLazySingleton<NewsRemoteDataSource>(() => NewsRemoteDataSourceImpl(client: locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
}
