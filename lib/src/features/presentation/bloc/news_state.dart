part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsEmpty extends NewsState {}

class NewsLoading extends NewsState {}

class NewsTestStatic extends NewsState {}

class NewsLoaded extends NewsState {
  final NewsEntity news;

  const NewsLoaded({required this.news});

  @override
  List<Object> get props => [news];
}

class NewsError extends NewsState {
  final String message;

  const NewsError({required this.message});

  @override
  List<Object> get props => [message];
}
