import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/src/features/domain/entities/news_entity.dart';
import 'package:flutter_news/src/features/presentation/bloc/news_cubit.dart';
import 'package:flutter_news/src/features/presentation/widgets/components/news_card.dart';
import 'package:flutter_news/src/features/presentation/widgets/mobile/components/carousel_mobile.dart';
import 'package:flutter_news/src/features/presentation/widgets/components/category_listview.dart';
import 'package:flutter_news/src/features/presentation/widgets/components/headline.dart';
import 'package:flutter_news/src/features/presentation/widgets/components/news_card_listview.dart';
import 'package:gap/gap.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,

          /// TODO: 1. Change the height of the toolbar to 90.h
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
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.blueAccent,
                ),
              );
            } else if (state is NewsError) {
              return Center(
                child: ElevatedButton(onPressed: () {}, child: const Text('Refresh')), // TODO: 2. Add a button to retry
              );
            } else if (state is NewsTestStatic) {
              return const SingleChildScrollView(
                child: Column(
                  children: [
                    CategoryListview(),
                    HeadLine(title: 'Breaking News!'),
                    Gap(10),
                    //CarouselMobile(news: null),
                    Gap(10),
                    HeadLine(title: 'Trending News!'),
                    NewsCard(
                        title:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unkno',
                        image: 'https://picsum.photos/500/500',
                        url: 'https://picsum.photos/500/500',
                        description: 'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unkno'),
                    //NewsCardListviewMobile(news: state.props.first as NewsEntity),
                  ],
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const CategoryListview(),
                    const HeadLine(title: 'Breaking News!'),
                    //const Gap(10),
                    CarouselMobile(news: state.props.first as NewsEntity),
                    const Gap(10),
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
