import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/src/config/routes/router.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final String? title;
  final String? description;
  final String? image;
  final String? url;

  const NewsCard({super.key, required this.title, required this.description, required this.image, required this.url});

  @override
  Widget build(BuildContext context) {
    double height = 180;
    double imageWidth = 140;
    double imageHeight = 140;

    if(ResponsiveBreakpoints.of(context).isMobile){
      height = 160;
      imageWidth = 120;
      imageHeight = 120;
    }

    return SizedBox(
      height: height,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        color: Theme.of(context).cardColor,
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    image ?? 'https://picsum.photos/500/500',
                    fit: BoxFit.cover,
                    width: imageWidth,
                    height: imageHeight,
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title ?? 'No Title',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2, // Adjust as needed
                          textAlign: TextAlign.justify,
                        ),
                        const Gap(10),
                        Text(
                          description ?? 'No Description',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2, // Adjust as needed
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
