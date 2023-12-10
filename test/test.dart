import 'dart:convert';

import 'package:flutter_news/src/core/constants/constants.dart';
import 'package:flutter_news/src/features/data/datasources/remote/remote_datasource.dart';
import 'package:flutter_news/src/features/data/datasources/remote/remote_datasource_impl.dart';
import 'package:flutter_news/src/features/data/models/article_model.dart';
import 'package:flutter_news/src/features/data/models/news_model.dart';
import 'package:flutter_news/src/features/data/repositories/news_repository_impl.dart';
import 'package:flutter_news/src/features/domain/repositories/news_repository.dart';
import 'package:flutter_news/src/features/domain/usecases/get_news.dart';
import 'package:flutter_news/src/features/domain/usecases/get_news_by_category.dart';
import 'package:flutter_news/src/features/domain/usecases/get_news_by_country_and_category.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

import 'json_reader.dart';

void main() {
  test('Test API calls', () async {
    final http.Client client = http.Client();

    final NewsRemoteDataSource newsRemoteDataSource = NewsRemoteDataSourceImpl(client: client);
    final NewsRepository newsRepository = NewsRepositoryImpl(newsRemoteDataSource: newsRemoteDataSource);

    final GetNews getNews = GetNews(newsRepository);
    final GetNewsByCategory getNewsByCategory = GetNewsByCategory(newsRepository);
    final GetNewsByCountryAndCategory getNewsByCountryAndCategory = GetNewsByCountryAndCategory(newsRepository);

    //var response = await client.get(Uri.parse(Urls.getUsNews()));
    //print(response.body);

    //final ArticleModel res = ArticleModel.fromJson(json.decode(readJson('article.json')));
    //final NewsModel res = NewsModel.fromJson(json.decode(readJson('example.json')));
    //print(res.articles[0].title);


    final result = await getNews.execute();

    //final result_country_category = await getNewsByCountryAndCategory.execute('hu', 'business');


    result.fold(
            (failure) => print(failure.message),
            (news) => print(news)
    );


  });
}
