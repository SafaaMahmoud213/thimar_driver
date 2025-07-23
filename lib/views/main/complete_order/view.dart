import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/design/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/design/app_image.dart';
import '../../../core/design/product_item.dart';
import '../../sheets/pay_sheet.dart';

class CompleteOrderView extends StatelessWidget {
  const CompleteOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "طلب #4587",
          style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.all(8),
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15.r)),
            child: const AppImages(
              url: "arro.png",
              width: 5,
              height: 5,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 13,
            ),
            Text(
              "تفاصيل الطلب",
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 21,
            ),
            const ProductItem(title: "تم التحضير"),
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
            AppButton(
              text: "إنهاء الطلب",
              onpress: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const PaySheet();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
