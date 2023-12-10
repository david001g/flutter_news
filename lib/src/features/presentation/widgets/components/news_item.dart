import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class NewsItem extends StatelessWidget {
  final String? title;
  final String? image;
  final String? url;
  const NewsItem({super.key, required this.title, required this.image, this.url});

  @override
  Widget build(BuildContext context) {
    final double width;
    final double height;

    if(ResponsiveBreakpoints.of(context).isMobile){
      width = 270;
      height = 290.h;
    } else if(ResponsiveBreakpoints.of(context).isTablet){
      width = 270;
      height = 290.h;
    } else {
      width = 270;
      height = 290.h;
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(
          image: NetworkImage(
              image ?? 'https://picsum.photos/500/500'),
          fit: BoxFit.cover,
        ),

      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Text(
              title ?? 'No Title',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
