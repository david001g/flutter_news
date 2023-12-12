import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/src/config/routes/router.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryArticle extends StatelessWidget {
  final String? title;
  final String? description;
  final String? image;
  final String? url;

  const CategoryArticle({
    super.key,
    this.title,
    this.description,
    this.image,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () async {
          if (url == null) {
            context.pushNamed(AppRoutes.error.name);
          } else if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) {
            context.pushNamed(AppRoutes.article.name, pathParameters: {'articleUrl': url!});
          } else if (!await launchUrl(Uri.parse(url ?? ''))) {
            print('Could not launch $url');
          }
        },
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                image ?? 'https://picsum.photos/500/500',
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Text(
                title ?? 'No Title', style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                overflow: TextOverflow.ellipsis,
                maxLines: 2, // Adjust as needed
                textAlign: TextAlign.justify,
              ),
              subtitle: Text(
                description ?? 'No Description', style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                overflow: TextOverflow.ellipsis,
                maxLines: 2, // Adjust as needed
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
