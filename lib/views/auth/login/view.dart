import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/design/app_button.dart';
import 'package:flutter_application_1/core/design/app_input.dart';
import 'package:flutter_application_1/views/auth/componant/view.dart';
import 'package:flutter_application_1/views/auth/forget_pass/view.dart';
import 'package:flutter_application_1/views/auth/login/bloc/bloc.dart';
import 'package:flutter_application_1/views/auth/login/bloc/event.dart';
import 'package:flutter_application_1/views/auth/login/bloc/states.dart';
import 'package:flutter_application_1/views/auth/register/view.dart';
import 'package:flutter_application_1/views/main/home_nav/view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

import '../../../core/logic/helper_method.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  String selectedCode = "966";
  final formKey = GlobalKey<FormState>();
  final bloc = KiwiContainer().resolve<LoginBloc>();
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
                  text1: "مرحبا بك مرة أخرى", text2: "يمكنك تسجيل الدخول الأن"),
              AppInput(
                url: "phone.png",
                text: " رقم الجوال",
                keyboardType: TextInputType.phone,
                onChangePhoneCode: (value) {
                  selectedCode = value;
                },
                controller: phoneController,
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
              AppInput(
                url: "lock.png",
                text: "كلمة المرور",
                controller: passwordController,
                keyboardType: TextInputType.text,
                width: 19,
                height: 20,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " يجب ان لا تكون كلمه المرور فارغه";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: GestureDetector(
                        onTap: () {
                          navigateTo(const ForgetPasswordView());
                        },
                        child: const Text("نسيت كلمة المرور ؟"))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {
                    if (state is LoginSuccessStates) {
                      navigateTo(const HomeNavView());
                    }
                  },
                  builder: (context, state) => AppButton(
                    text: " تسجيل الدخول",
                    isLoading: state is LoginLoadingStates,
                    onpress: () {
                      if (formKey.currentState!.validate()) {
                        bloc.add(
                          LoginLGetEvent(
                              password: passwordController.text,
                              phone: phoneController.text,
                              code: selectedCode),
                        );
                      }
                    },
                    width: double.infinity,
                    height: 55,
                  ),
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
                        navigateTo(const RegisterView());
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
