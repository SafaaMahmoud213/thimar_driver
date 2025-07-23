import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/main/home_nav/pages/notification/bloc/bloc.dart';
import 'package:flutter_application_1/views/main/home_nav/pages/notification/bloc/event.dart';
import 'package:flutter_application_1/views/main/home_nav/pages/notification/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

import '../../../../../core/design/app_failed.dart';
import '../../../../../core/design/app_image.dart';
import '../../../../../core/design/app_loading.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> title = ["طلب جديد بإنتظارك", "رسالة إدارية"];
    final bloc = KiwiContainer().resolve<NotificationBloc>()
      ..add(GetNotificationEvents());
    final List<String> images = [
      "term.png",
      "logo1.png",
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Text(""),
        title: Text(
          "الإشعارات",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is NotifactionSuccessStates) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 2
                      // state.list.notifications.length
                      ,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 245, 243, 243)),
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.all(4),
                                width: 33.w,
                                height: 33.h,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Center(
                                  child: AppImages(
                                    url: images[index],
                                    width: 20,
                                    height: 20,
                                  ),
                                )),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  title[index],
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  " هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم\n توليد هذا النص من مولد النص العربى",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 3.h),
                                Text(
                                  "منذ ساعتان",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if (state is NotifactionFailedStates) {
              return Appfailed(msg: state.msg);
            } else {
              return const AppLoading();
            }
          }),
    );
  }
}
