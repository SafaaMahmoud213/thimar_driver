import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/my_account/suggestions/bloc/bloc.dart';
import 'package:flutter_application_1/views/my_account/suggestions/bloc/event.dart';
import 'package:flutter_application_1/views/my_account/suggestions/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

import '../../../core/design/app_button.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/app_input.dart';
import '../../../core/logic/helper_method.dart';
import '../../main/home_nav/pages/my_account_home/view.dart';

class SuggestionView extends StatefulWidget {
  const SuggestionView({super.key});

  @override
  State<SuggestionView> createState() => _SuggestionViewState();
}

class _SuggestionViewState extends State<SuggestionView> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final bloc = KiwiContainer().resolve<SuggestionsBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الأقتراحات والشكاوي  ",
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
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15)),
            child: const AppImages(
              url: "arro.png",
              width: 5,
              height: 5,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.only(top: 51.h, left: 17, right: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppinputText(
                  text: "الإسم",
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " يجب ادخال الاسم  ";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                AppinputText(
                  text: "رقم الموبايل",
                  controller: phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " يجب ادخال رقم الموبايل صحيح  ";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                AppinputText(
                  text: "الموضوع",
                  maxLines: 3,
                  controller: titleController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " يجب ادخال الموضوع    ";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 22.h,
                ),
                BlocConsumer(
                    bloc: bloc,
                    listener: (context, state) {
                      if (state is SuggestionsSuccessState) {
                        showMessage(state.msg);
                        navigateTo(const MyAccountView());
                      }
                    },
                    builder: (context, state) {
                      return AppButton(
                        text: "إرسال",
                        isLoading: state is SuggestionsLoadingState,
                        onpress: () {
                          if (formKey.currentState!.validate()) {
                            bloc.add(
                              GetSuggestionEvents(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  title: titleController.text),
                            );
                          }
                        },
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
