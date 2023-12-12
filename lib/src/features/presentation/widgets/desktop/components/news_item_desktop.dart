import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/src/config/routes/router.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItemDesktop extends StatelessWidget {
  final String? title;
  final String? image;
  final String? url;

  const NewsItemDesktop({super.key, required this.title, required this.image, this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () async {
        if (url == null) {
          context.pushNamed(AppRoutes.error.name);
        } else if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) {
          context.pushNamed(AppRoutes.article.name, pathParameters: {'articleUrl': url!});
        } else if (!await launchUrl(Uri.parse(url ?? ''))) {
          print('Could not launch $url');
        }
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image ?? 'https://picsum.photos/500/500',
              fit: BoxFit.cover,
              width: 290,
              height: 250,
            ),
          ),
          Container(
            height: 60,
            width: 290,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  title ?? 'No Title',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
