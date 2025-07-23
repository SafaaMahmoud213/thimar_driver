import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'canceled_order/view.dart';
import 'current_order/view.dart';

class MyOrderView extends StatelessWidget {
  const MyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Text(""),
        title: Text(
          "طلباتي",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Material(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                height: 55,
                child: TabBar(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.all(4),
                    labelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: Theme.of(context).primaryColor,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).primaryColor),
                    tabs: const [
                      Tab(
                        child: SizedBox(
                          child: Center(
                              child: Text(
                            "الحاليه",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          child: Center(
                              child: Text(
                            "المنتهية",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      )
                    ]),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [CurrentOrderView(), CanceledOrderView()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
