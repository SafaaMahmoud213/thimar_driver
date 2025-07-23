import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/main/home_nav/pages/home/view.dart';
import 'package:flutter_application_1/views/main/home_nav/pages/my_account_home/view.dart';
import 'package:flutter_application_1/views/main/home_nav/pages/my_order/view.dart';
import 'package:flutter_application_1/views/main/home_nav/pages/notification/view.dart';

import '../../../core/design/app_image.dart';

class HomeNavView extends StatefulWidget {
  const HomeNavView({super.key});

  @override
  State<HomeNavView> createState() => _HomeNavViewState();
}

class _HomeNavViewState extends State<HomeNavView> {
  int current = 0;
  List<String> images = [
    "home.png",
    "order.png",
    "noti.png",
    "person.png",
  ];
  List<String> texts = [
    "الرئيسية",
    "طلباتي",
    "الإشعارات",
    "حسابي",
  ];
  List<Widget> pages = [
    const HomeView(),
    const MyOrderView(),
    const NotificationView(),
    const MyAccountView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(color: Colors.white),
          unselectedLabelStyle: const TextStyle(color: Colors.white),
          selectedItemColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: current,
          onTap: (value) {
            current = value;
            setState(() {});
          },
          items: List.generate(
            pages.length,
            (index) => BottomNavigationBarItem(
              icon: AppImages(
                url: images[index],
                color: current == index ? Colors.white : Colors.grey[300],
                width: current == index ? 21 : 17,
                height: 21,
              ),
              label: texts[index],
            ),
          ),
        ),
        body: pages[current]
        // IndexedStack(
        //   index: current,
        //   children: pages,
        // ),
        );
  }
}
