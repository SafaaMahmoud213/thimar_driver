import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/design/app_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgactDetailes extends StatelessWidget {
  const ProgactDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "عنوان التوصيل",
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          Container(
            margin: const EdgeInsets.all(8),
            width: 350.w,
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey.shade100),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " المنزل",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      " شقة 40",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Text(
                      " شارع العليا الرياض 1252السعودية ",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const AppImages(
                  url: "map.png",
                  width: 68,
                  height: 62,
                ),
              ],
            ),
          ),
          Text(
            " ملخص الطلب",
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(
            height: 19.h,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade300),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "إجمالي المنتجات",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "ر.س180",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "التوصيل ",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "ر.س40",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Text(
                      "المجموع ",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "ر.س220",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "تم الدفع بواسطة ",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const AppImages(
                      url: "visa.png",
                      width: 45,
                      height: 13,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 85.h,
          ),
        ],
      ),
    );
  }
}
