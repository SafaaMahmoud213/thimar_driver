import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/auth/componant/view.dart';
import 'package:flutter_application_1/views/auth/login/view.dart';

import '../../../core/design/app_button.dart';
import '../../../core/design/app_input.dart';
import '../../../core/logic/helper_method.dart';

class ChangePassView extends StatefulWidget {
  const ChangePassView({super.key});

  @override
  State<ChangePassView> createState() => _ChangePassViewState();
}

class _ChangePassViewState extends State<ChangePassView> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AuthHeader(
                  text1: "   نسيت كلمة المرور",
                  text2: " أدخل كلمة المرور الجديدة"),
              AppInput(
                url: "lock.png",
                text: " كلمة المرور الجديدة ",
                keyboardType: TextInputType.text,
                controller: passwordController,
                width: 19,
                height: 20,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " يجب ان لا تكون كلمه المرور فارغه";
                  }
                  return null;
                },
              ),
              AppInput(
                url: "lock.png",
                text: " تأكيد كلمة المرور ",
                keyboardType: TextInputType.text,
                controller: confirmPasswordController,
                width: 19,
                height: 20,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " يجب ان تكون كلمه المرور متطابقه";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: AppButton(
                  text: " تغيير كلمة المرور ",
                  onpress: () {
                    if (formKey.currentState!.validate()) {
                      if (passwordController.text ==
                          confirmPasswordController.text) {
                        navigateTo(const LoginView());
                      } else {
                        return showMessage("يجب ادخال كلمه المرور صحيحه");
                      }
                    }
                  },
                  width: double.infinity,
                  height: 55,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ليس لديك حساب ؟",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        navigateTo(const LoginView());
                      },
                      child: Text(
                        "تسجيل الأن",
                        style: TextStyle(
                            fontSize: 16,
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
