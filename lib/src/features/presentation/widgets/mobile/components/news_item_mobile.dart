import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/src/common/network_image.dart';
import 'package:flutter_news/src/config/routes/router.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItemMobile extends StatelessWidget {
  final String? title;
  final String? image;
  final String? url;

  const NewsItemMobile({super.key, required this.title, required this.image, this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          InkWell(
              onTap: () async {
                if (url == null) {
                  context.pushNamed(AppRoutes.error.name);
                } else if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) {
                  context.pushNamed(AppRoutes.article.name, pathParameters: {'articleUrl': url!});
                } else if (!await launchUrl(Uri.parse(url ?? ''))) {
                  print('Could not launch $url');
                }
              },
              child: CustomNetworkImage(width: MediaQuery.of(context).size.width, height: 200, image: image)),
          Container(
            height: 80,
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
