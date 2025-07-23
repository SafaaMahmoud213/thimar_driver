import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/my_account/about_app/bloc/bloc.dart';
import 'package:flutter_application_1/views/my_account/about_app/bloc/event.dart';
import 'package:flutter_application_1/views/my_account/about_app/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:kiwi/kiwi.dart';

import '../../../core/design/app_failed.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/app_loading.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = KiwiContainer().resolve<AboutBloc>()..add(GetAboutEvents());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "عن التطبيق   ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
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
      body: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is AboutSuccessState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: AppImages(
                      url: "logo1.png",
                      width: 160,
                      height: 160,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: HtmlWidget(state.list.about),
                  )
                ],
              );
            } else if (state is AboutFailedState) {
              return Appfailed(msg: state.msg);
            }
            return const AppLoading();
          }),
    );
  }
}
