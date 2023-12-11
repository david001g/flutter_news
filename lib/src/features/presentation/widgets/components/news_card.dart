import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final String? title;
  final String? description;
  final String? image;
  final String? url;

  const NewsCard({super.key, required this.title, required this.description, required this.image, required this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        color: Theme.of(context).cardColor,
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: InkWell(
          onTap: () async {
            if (!await launchUrl(Uri.parse(url ?? ''))) {
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
                    width: 120,
                    height: 120,
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
