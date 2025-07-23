import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/design/app_image.dart';
import '../../../../../core/logic/cache_helper.dart';
import '../../../../../core/logic/helper_method.dart';
import '../../../../auth/login/view.dart';
import '../../../../my_account/about_app/view.dart';
import '../../../../my_account/contact_us/view.dart';
import '../../../../my_account/faqs/view.dart';
import '../../../../my_account/my_profile/view.dart';
import '../../../../my_account/privacy/view.dart';
import '../../../../my_account/suggestions/view.dart';

class MyAccountView extends StatefulWidget {
  const MyAccountView({super.key});

  @override
  State<MyAccountView> createState() => _MyAccountViewState();
}

class _MyAccountViewState extends State<MyAccountView> {
  final List<String> text = [
    "البيانات الشخصية",
    "عن التطبيق",
    "أسئلة متكررة",
    "سياسة الخصوصية",
    "تواصل معنا",
    "الشكاوي والأقتراحات",
  ];
  final List<Function()> onTap = [
    () {
      navigateTo(const MyProfileView());
    },
    () {
      navigateTo(const AboutAppView());
    },
    () {
      navigateTo(const FAQSview());
    },
    () {
      navigateTo(const PrivacyView());
    },
    () {
      navigateTo(const ContactUsView());
    },
    () {
      navigateTo(const SuggestionView());
    },
  ];
  final List<String> images = [
    "person.png",
    "about.png",
    "qui.png",
    "check.png",
    "call.png",
    "edit.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 43),
              width: double.infinity,
              height: 217,
              decoration: const BoxDecoration(
                  color: Color(0xff4C8613),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "حسابي",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const AppImages(
                    url: "pers.png",
                    width: 76,
                    height: 71,
                  ),
                  Text(
                    "محمد علي",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "96654787856+",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: onTap[index],
                    child: Row(
                      children: [
                        AppImages(
                          url: images[index],
                          width: 14,
                          height: 18,
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Text(
                          text[index],
                          style: TextStyle(
                              fontSize: 13,
                              color: Theme.of(context).primaryColor),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(4),
                          width: 18.w,
                          height: 18.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade500),
                              borderRadius: BorderRadius.circular(10)),
                          child: const AppImages(
                            url: "back2.png",
                            width: 7,
                            height: 5,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            InkWell(
              onTap: () {
                CachHelper().setToken(token: '');
                navigateTo(const LoginView());
              },
              child: Container(
                margin: const EdgeInsets.all(16.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 9,
                    ),
                    Text(
                      "تسجيل الخروج",
                      style: TextStyle(
                          fontSize: 13, color: Theme.of(context).primaryColor),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(4),
                      width: 18.w,
                      height: 18.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade500),
                          borderRadius: BorderRadius.circular(10)),
                      child: const AppImages(
                        url: "log.png",
                        width: 7,
                        height: 5,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
