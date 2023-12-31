import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/src/features/domain/entities/news_entity.dart';
import 'package:flutter_news/src/features/presentation/bloc/news_cubit.dart';
import 'package:flutter_news/src/features/presentation/widgets/components/category_listview.dart';
import 'package:flutter_news/src/features/presentation/widgets/components/headline.dart';
import 'package:flutter_news/src/features/presentation/widgets/components/news_card_listview.dart';
import 'package:flutter_news/src/features/presentation/widgets/desktop/components/news_list_desktop.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NewsCubit>().loadNews();
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
      ),
      body: SafeArea(
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsEmpty) {
              return const Center(
                child: Text('Empty'),
              );
            } else if (state is NewsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.blueAccent,
                ),
              );
            } else if (state is NewsError) {
              return Center(
                child: ElevatedButton(
                    onPressed: () {
                      context.read<NewsCubit>().loadNews();
                    },
                    child: const Text('Refresh')), // TODO: 2. Add a button to retry
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const CategoryListview(),
                    const HeadLine(title: 'Breaking News!'),
                    NewsListDesktop(news: state.props.first as NewsEntity),
                    const HeadLine(title: 'Trending News!'),
                    NewsCardListview(news: state.props.first as NewsEntity),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
