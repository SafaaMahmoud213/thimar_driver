import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/design/app_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../views/main/home_nav/pages/home/model/model_home.dart';

class ProductItem extends StatefulWidget {
  final String title;
  final HomeModel? model;
  const ProductItem({super.key, required this.title, this.model});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "طلب #4587",
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            const Spacer(),
            Container(
              width: 95,
              height: 23,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade100),
              child: Center(
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 11.sp, color: Theme.of(context).primaryColor),
                ),
              ),
            )
          ],
        ),
        const Text(
          "27,يونيو,2021,",
          style: TextStyle(
            fontSize: 14,
            color: Color(
              0xffB9C9A8,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const AppImages(
              url: "man.png",
              width: 46,
              height: 41,
            ),
            const SizedBox(
              width: 11,
            ),
            Column(
              children: [
                Text(
                  "أحمد علاء",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Row(
                  children: [
                    AppImages(
                      url: "location.png",
                      width: 12,
                      height: 14,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("الرياض"),
                  ],
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            const AppImages(
              url: "tom.png",
              width: 25,
              height: 25,
            ),
            const AppImages(
              url: "tom.png",
              width: 25,
              height: 25,
            ),
            const AppImages(
              url: "tom.png",
              width: 25,
              height: 25,
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  "+2",
                  style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Text(
              "180ر.س",
              style: TextStyle(
                  fontSize: 14, color: Theme.of(context).primaryColor),
            )
          ],
        ),
      ],
    );
  }
}
