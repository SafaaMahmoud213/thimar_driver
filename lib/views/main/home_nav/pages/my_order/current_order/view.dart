import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/logic/helper_method.dart';

import '../../../../../../core/design/app_image.dart';
import '../../../../../../core/design/product_item.dart';
import '../../../../start_delivery/view.dart';

class CurrentOrderView extends StatelessWidget {
  const CurrentOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(10),
              width: 375,
              height: 55,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 236, 230, 230),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Row(
                children: [
                  AppImages(
                    url: "search.png",
                    width: 18,
                    height: 18,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "ابحث عن ماتريد؟",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(
                        0xffB9C9A8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            GestureDetector(
              onTap: () {
                navigateTo(const StartDeliveryView());
              },
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 12,
                itemBuilder: (context, index) {
                  return const ProductItem(
                    title: "تم التحضير",
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
