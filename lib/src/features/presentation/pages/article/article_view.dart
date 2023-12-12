import 'package:flutter/material.dart';
import 'package:flutter_news/src/features/presentation/widgets/mobile/components/web_view_container.dart';
import 'package:gap/gap.dart';

class ArticleView extends StatelessWidget {
  final String url;

  const ArticleView({super.key, required this.url});

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
      body: SafeArea(child: WebViewContainer(url: url)),
    );
  }
}
