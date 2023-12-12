import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/src/features/domain/entities/news_entity.dart';
import 'package:flutter_news/src/features/presentation/bloc/news_cubit.dart';
import 'package:flutter_news/src/features/presentation/widgets/mobile/components/category_article_list.dart';
import 'package:gap/gap.dart';

class TopNewsMobile extends StatelessWidget {

  const TopNewsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: const Color(0xff14181b), fontWeight: FontWeight.normal)),
            Text(
              'News',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        centerTitle: true,
        actions: const [
          Gap(50),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (BuildContext context, NewsState state) {
            switch (state.runtimeType) {
              case NewsEmpty:
                return const Center(child: Text('No posts'));
              case NewsLoading:
                return const Center(child: CircularProgressIndicator());
              case NewsLoaded:
                var news = state.props[0] as NewsEntity;
                return CategoryArticleList(news: news);
              case NewsError:
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
