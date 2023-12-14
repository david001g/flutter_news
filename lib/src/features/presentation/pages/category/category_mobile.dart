import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/src/features/domain/entities/news_entity.dart';
import 'package:flutter_news/src/features/presentation/bloc/category_cubit.dart';
import 'package:flutter_news/src/features/presentation/widgets/mobile/components/category_article_list.dart';
import 'package:gap/gap.dart';

class CategoryMobile extends StatelessWidget {
  final String categoryName;

  const CategoryMobile({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    context.read<CategoryCubit>().loadNewsByCategory(categoryName.toLowerCase());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(categoryName, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        centerTitle: true,
        actions: const [
          Gap(50),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (BuildContext context, CategoryState state) {
            switch (state.runtimeType) {
              case CategoryEmpty:
                return const Center(child: Text('No posts'));
              case CategoryLoading:
                return const Center(child: CircularProgressIndicator());
              case CategoryLoaded:
                var news = state.props[0] as NewsEntity;
                return CategoryArticleList(news: news);
              case CategoryError:
                return Center(
                    child: ElevatedButton(onPressed: () {}, child: const Text('Refresh'))); // TODO: 2. Add a button to retry
              default:
                return Center(
                    child: ElevatedButton(onPressed: () {}, child: const Text('Refresh'))); // TODO: 2. Add a button to retry
            }
          },
        ),
      ),
    );
  }
}
