import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/my_account/faqs/bloc/bloc.dart';
import 'package:flutter_application_1/views/my_account/faqs/bloc/event.dart';
import 'package:flutter_application_1/views/my_account/faqs/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

import '../../../core/design/app_failed.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/app_loading.dart';

class FAQSview extends StatelessWidget {
  const FAQSview({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = KiwiContainer().resolve<FAQSBloc>()..add(GetFAQSEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "أسئلة متكررة  ",
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
      body: SingleChildScrollView(
        child: BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              if (state is FAQSSuccessStates) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.list.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: ExpansionTile(
                      collapsedIconColor: Colors.black,
                      iconColor: Colors.grey,
                      key: Key("$index"),
                      title: Text(
                        state.list[index].question,
                        style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).primaryColor),
                      ),
                      children: <Widget>[
                        ListTile(
                            title: Text(
                          state.list[index].answer,
                        )),
                      ],
                    ),
                  ),
                );
              } else if (state is FAQSFailedStates) {
                return Appfailed(msg: state.msg);
              }
              return const AppLoading();
            }),
      ),
    );
  }
}
