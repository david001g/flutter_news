import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news/src/features/domain/entities/news_entity.dart';
import 'package:flutter_news/src/features/domain/usecases/get_news.dart';
import 'package:flutter_news/src/features/domain/usecases/get_news_by_category.dart';
import 'package:flutter_news/src/features/domain/usecases/get_news_by_country_and_category.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final GetNews getNews;
  final GetNewsByCategory getNewsByCategory;
  final GetNewsByCountryAndCategory getNewsByCountryAndCategory;

  NewsCubit(this.getNewsByCategory, this.getNewsByCountryAndCategory, this.getNews) : super(NewsEmpty());

  void loadNews() async {
    emit(NewsLoading());
    final result = await getNews.execute();
    result.fold(
      (failure) {
        print("getNews call failed: ${failure.message}");
        emit(NewsError(message: failure.message));
      },
      (news) => emit(NewsLoaded(news: news))
    );
  }

  void loadNewsByCategory(String category) async {
    emit(NewsLoading());
    final result = await getNewsByCategory.execute(category);
    result.fold(
      (failure) {
        print("getNewsByCategory call failed: ${failure.message}");
        emit(NewsError(message: failure.message));
      },
      (news) => emit(NewsLoaded(news: news))
    );
  }

  void loadNewsByCountryAndCategory(String country, String category) async {
    emit(NewsLoading());
    final result = await getNewsByCountryAndCategory.execute(country, category);
    result.fold(
      (failure) {
        print("getNewsByCountryAndCategory call failed: ${failure.message}");
        emit(NewsError(message: failure.message));
      },
      (news) => emit(NewsLoaded(news: news))
    );
  }
}
