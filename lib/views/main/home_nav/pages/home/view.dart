import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/logic/helper_method.dart';
import 'package:flutter_application_1/views/main/home_nav/pages/home/bloc/bloc.dart';
import 'package:flutter_application_1/views/main/home_nav/pages/home/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

import '../../../../../core/design/app_failed.dart';
import '../../../../../core/design/app_image.dart';
import '../../../../../core/design/app_loading.dart';
import '../../../../../core/design/product_item.dart';
import '../../../order_details/view.dart';
import 'bloc/event.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = KiwiContainer().resolve<HomeBloc>()..add(GetEventHome());
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          width: 72.w,
          height: 20.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo1.png",
                width: 18,
                height: 18,
              ),
              Text(
                "سلة ثمار",
                style: TextStyle(
                    fontSize: 9.sp, color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
        title: Text(
          "الرئيسية",
          style:
              TextStyle(fontSize: 20.sp, color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 375,
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 230, 230),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
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
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is HomeSuccessStates) {
                      return ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 5,
                              ),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.list.length,
                          itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                navigateTo(const OrderDetailsView());
                              },
                              child: ProductItem(
                                model: state.list[index],
                                title: 'بإنتظار الموافقة',
                              )));
                    } else if (state is HomeFailedStates) {
                      return Appfailed(msg: state.msg);
                    } else {
                      return const AppLoading();
                    }
                  }),
            ],
          )),
    );
  }
}
