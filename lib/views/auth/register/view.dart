import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/auth/componant/view.dart';
import 'package:flutter_application_1/views/auth/dot_widget/view.dart';
import 'package:flutter_application_1/views/auth/login/view.dart';
import 'package:flutter_application_1/views/auth/new_account/view.dart';
import 'package:flutter_application_1/views/auth/register/bloc/bloc.dart';
import 'package:flutter_application_1/views/auth/register/bloc/event.dart';
import 'package:flutter_application_1/views/auth/register/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

import '../../../core/design/app_button.dart';
import '../../../core/design/app_input.dart';
import '../../../core/logic/helper_method.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final identityNumberController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  String selectedCode = "966";
  final formKey = GlobalKey<FormState>();
  final bloc = KiwiContainer().resolve<RegisterBloc>();

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
                    text1: "مرحبا بك مرة أخرى",
                    text2: "يمكنك تسجيل الدخول الأن"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 29,
                      height: 29,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Theme.of(context).primaryColor),
                      child: const Center(
                        child: Text(
                          "1",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                    const DotWidget(),
                    Container(
                      width: 29,
                      height: 29,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.shade300),
                      child: Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                AppInput(
                    url: "user.png",
                    text: " اسم المندوب",
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "يجب ادخال اسم  المندوب صحيح";
                      }
                      return null;
                    },
                    width: 16,
                    height: 20),
                AppInput(
                  url: "phone.png",
                  text: " رقم الجوال",
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  onChangePhoneCode: (value) {
                    selectedCode = value;
                  },
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
                  url: "city.png",
                  text: "المدينة",
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " يجب ان لا تكون المدينة فارغه";
                    }
                    return null;
                  },
                  width: 19,
                  height: 20,
                ),
                AppInput(
                  url: "location.png",
                  text: "تحديد الموقع على الخريطة",
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "يجبب تحديد الموقع ";
                    }
                    return null;
                  },
                  width: 19,
                  height: 20,
                ),
                AppInput(
                  url: "person.png",
                  text: "رقم الهوية",
                  keyboardType: TextInputType.text,
                  controller: identityNumberController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " يجب ان لا يكون رقم الهوية فارغه";
                    }
                    return null;
                  },
                  width: 19,
                  height: 20,
                ),
                AppInput(
                  url: "email.png",
                  text: "البريد الالكتروني ",
                  keyboardType: TextInputType.text,
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " يجب ان لا تكون  البريد الالكتروني";
                    }
                    return null;
                  },
                  width: 19,
                  height: 20,
                ),
                AppInput(
                  url: "lock.png",
                  text: "كلمة المرور",
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " يجب ان لا تكون كلمه المرور فارغه";
                    }
                    return null;
                  },
                  width: 19,
                  height: 20,
                ),
                AppInput(
                  url: "lock.png",
                  text: "تأكيد كلمة المرور   ",
                  width: 19,
                  controller: passwordConfirmationController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " يجب ان لا تكون كلمه المرور فارغه";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: BlocConsumer(
                    bloc: bloc,
                    listener: (context, state) {
                      if (state is RegisterSuccessStates) {
                        navigateTo(const NewAccountView());
                      }
                    },
                    builder: (context, state) => AppButton(
                      text: "التالي ",
                      isLoading: state is RegisterLoadingStates,
                      onpress: () {
                        if (formKey.currentState!.validate()) {
                          bloc.add(
                            RegisterGetEvent(
                                email: emailController.text,
                                identityNumber: identityNumberController.text,
                                passwordConfirmation:
                                    passwordConfirmationController.text,
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
                        " لديك حساب بالفعل ؟",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateTo(const LoginView());
                        },
                        child: Text(
                          "تسجيل الدخول ",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
