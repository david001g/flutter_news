import 'package:flutter_news/src/features/data/models/news_model.dart';

abstract class NewsRemoteDataSource {

  Future<NewsModel> getNews();

  Future<NewsModel> getNewsByCategory(String category);

  Future<NewsModel> getNewsByCountryAndCategory(String country, String category);
}
