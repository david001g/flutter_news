import 'dart:convert';

import 'package:flutter_news/src/core/constants/constants.dart';
import 'package:flutter_news/src/core/error/exception.dart';
import 'package:flutter_news/src/features/data/datasources/remote/remote_datasource.dart';
import 'package:flutter_news/src/features/data/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  final http.Client client;

  NewsRemoteDataSourceImpl({required this.client});

  @override
  Future<NewsModel> getNews() async {
    final response = await client.get(Uri.parse(Urls.getUsNews()));

    try {
      if (response.statusCode == 200) {
        return NewsModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException(message: 'Code: ${response.statusCode} - Body: ${response.body}');
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<NewsModel> getNewsByCategory(String category) async {
    final response = await client.get(Uri.parse(Urls.getUsNewsByCategory(category)));

    try {
      if (response.statusCode == 200) {
        return NewsModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException(message: 'Code: ${response.statusCode} - Body: ${response.body}');
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<NewsModel> getNewsByCountryAndCategory(String country, String category) async {
    final response = await client.get(Uri.parse(Urls.getNewsByCountryAndCategory(country, category)));

    try {
      if (response.statusCode == 200) {
        return NewsModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException(message: 'Code: ${response.statusCode} - Body: ${response.body}');
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
