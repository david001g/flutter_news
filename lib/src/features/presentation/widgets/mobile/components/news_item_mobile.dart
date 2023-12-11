import 'package:flutter/material.dart';

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
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image ?? 'https://picsum.photos/500/500',
              fit: BoxFit.cover,
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
          ),
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
