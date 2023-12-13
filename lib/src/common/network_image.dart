import 'package:flutter/material.dart';
import 'package:flutter_news/src/core/constants/constants.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? image;
  final double width;
  final double height;
  late BorderRadius? borderRadius;

  CustomNetworkImage({super.key, this.image, required this.width, required this.height, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    borderRadius ??= BorderRadius.circular(10);

    return ClipRRect(
      borderRadius: borderRadius!,
      child: image == null
          ? Image.asset(
              AssetImages.noImage,
              fit: BoxFit.cover,
              width: width,
              height: height,
            )
          : Image.network(
              errorBuilder: (context, error, stackTrace) => Image.asset(
                AssetImages.noImage,
                fit: BoxFit.cover,
                width: width,
                height: height,
              ),
              image!,
              fit: BoxFit.cover,
              width: width,
              height: height,
            ),
    );
  }
}
