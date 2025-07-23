import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotWidget extends StatelessWidget {
  final double totalWidth, dashWidth, emptyWidth, dashHeight;

  const DotWidget({
    this.totalWidth = 100,
    this.dashWidth = 6,
    this.emptyWidth = 2,
    this.dashHeight = 2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalWidth.w ~/ (dashWidth + emptyWidth),
        (_) => Container(
          width: dashWidth.w,
          height: dashHeight.h,
          color: Theme.of(context).primaryColor,
          margin:
              EdgeInsets.only(left: emptyWidth.w / 2, right: emptyWidth.w / 2),
        ),
      ),
    );
  }
}
