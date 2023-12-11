import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/src/features/domain/entities/news_entity.dart';
import 'package:flutter_news/src/features/presentation/bloc/news_cubit.dart';
import 'package:flutter_news/src/features/presentation/widgets/components/category_listview.dart';
import 'package:flutter_news/src/features/presentation/widgets/components/headline.dart';
import 'package:flutter_news/src/features/presentation/widgets/components/news_card_listview.dart';
import 'package:flutter_news/src/features/presentation/widgets/components/news_list.dart';
import 'package:flutter_news/src/features/presentation/widgets/desktop/components/news_list_desktop.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Center(
            child: Text(
              'Flutter News',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        body: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsEmpty) {
              return const Center(
                child: Text('Empty'),
              );
            } else if (state is NewsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NewsError) {
              return const Center(
                child: Text('Something went wrong!'),
              );
            }
            else if(state is NewsTestStatic){
              return const Center(
                child: Text('Test'),
              );
            }
            else {
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
