import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news/src/features/domain/entities/news_entity.dart';
import 'package:flutter_news/src/features/domain/usecases/get_news_by_category.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetNewsByCategory getNewsByCategory;

  CategoryCubit(this.getNewsByCategory) : super(CategoryEmpty());

  void loadNewsByCategory(String category) async {
    emit(CategoryLoading());
    final result = await getNewsByCategory.execute(category);
    result.fold(
            (failure) {
          print("getNewsByCategory call failed: ${failure.message}");
          emit(CategoryError(message: failure.message));
        },
            (news) => emit(CategoryLoaded(news: news))
    );
  }
}
