import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppImages extends StatelessWidget {
  final String url;
  final double? width, height;
  final BoxFit fit;
  final Color? color;
  const AppImages(
      {super.key,
      required this.url,
      this.width,
      this.height,
      this.fit = BoxFit.scaleDown,
      this.color});

  @override
  Widget build(BuildContext context) {
    if (url.startsWith("http")) {
      return Image.network(
        url,
        width: width?.w,
        color: color,
        height: height?.h,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => Image.asset(
          "error.png",
          width: 20.w,
          height: 20.h,
        ),
      );
    } else if (url.endsWith("svg")) {
      return SvgPicture.asset(
        "assets/icons/$url",
        width: width?.w,
        height: height?.h,
        fit: fit,
      );
    }
    return Image.asset(
      "assets/images/$url",
      width: width?.w,
      color: color,
      height: height?.h,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => Image.asset(
        "error.png",
        width: 20.w,
        height: 20.h,
      ),
    );
  }
}
