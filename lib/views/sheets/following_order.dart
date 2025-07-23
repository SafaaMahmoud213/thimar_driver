import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/design/app_button.dart';
import 'package:flutter_application_1/core/design/app_image.dart';
import 'package:flutter_application_1/core/logic/helper_method.dart';
import 'package:flutter_application_1/views/main/home_nav/pages/my_order/view.dart';

class FollowimgOrder extends StatelessWidget {
  const FollowimgOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 307,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppImages(
            url: "confirm.png",
            width: 134,
            height: 134,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "تم قبولك الطلب بنجاح",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          Text(
            "يمكنك متابعة الطلب لتسليم المنتجات وإنهائه",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          AppButton(
            text: "متابعة الطلب",
            width: 343,
            height: 60,
            onpress: () {
              navigateTo(const MyOrderView());
            },
          ),
        ],
      ),
    );
  }
}
