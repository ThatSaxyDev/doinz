// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:doinz/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageLoader extends StatelessWidget {
  // final String imagePath;
  final String imageUrl;
  final double? height;
  final double? width;
  const ImageLoader({
    Key? key,
    // required this.imagePath,
    required this.imageUrl,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: CachedNetworkImage(
        height: height ?? 83.h,
        width: width ?? 84.w,
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        // imageUrl: AppUrls.photoUrl(imagePath: imagePath),
        placeholder: (context, url) => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black12.withOpacity(0.1),
                Colors.black12.withOpacity(0.1),
                Colors.black26,
                Colors.black26,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
        )
            .animate(onPlay: (controller) => controller.repeat())
            .shimmer(duration: 1200.ms),
        errorWidget: (context, url, error) => Container(
          color: Pallete.darkBlueGrey.withOpacity(0.1),
          child: Center(
            child: Icon(
              Icons.error,
              size: 30.sp,
            ),
          ),
        ),
      ),
    );
  }
}
