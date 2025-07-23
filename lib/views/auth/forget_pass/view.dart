import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/logic/helper_method.dart';
import 'package:flutter_application_1/views/auth/componant/view.dart';
import 'package:flutter_application_1/views/auth/confirm_pass/view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/design/app_button.dart';
import '../../../core/design/app_input.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AuthHeader(
                  text1: "مرحبا بك مرة أخرى",
                  text2: "يمكنك تسجيل حساب جديد الأن"),
              AppInput(
                url: "phone.png",
                text: " رقم الجوال",
                keyboardType: TextInputType.phone,
                width: 19,
                height: 20,
                isphone: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " يجب ادخال رقم الجوال صحيح  ";
                  } else if (value.length < 10) {
                    return " يجب ان يتكون من 11 رقم ";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: AppButton(
                    text: "تأكيد رقم الجوال",
                    onpress: () {
                      if (formKey.currentState!.validate()) {
                        navigateTo(const ConfirmPasswordView());
                      }
                    },
                    width: 343,
                    height: 60),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " لديك حساب بالفعل ؟",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "تسجيل الدخول ",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
