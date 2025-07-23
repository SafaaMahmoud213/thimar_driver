import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/design/app_button.dart';
import 'package:flutter_application_1/core/design/app_image.dart';
import 'package:flutter_application_1/views/auth/componant/view.dart';
import 'package:flutter_application_1/views/auth/confirm_code/view.dart';
import 'package:flutter_application_1/views/auth/dot_widget/view.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

import '../../../core/design/app_input.dart';
import '../../../core/logic/helper_method.dart';

class NewAccountView extends StatefulWidget {
  const NewAccountView({super.key});

  @override
  State<NewAccountView> createState() => _NewAccountViewState();
}

class _NewAccountViewState extends State<NewAccountView> {
  final formKey = GlobalKey<FormState>();
  List<String> title = [
    "صورة رخصة القيادة",
    "استمارة السيارة",
    "تأمين السيارة",
    "السيارة من الأمام",
    "السيارة من الخلف",
  ];
  bool values = false;

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
                Column(
                  children: [
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                        const DotWidget(),
                        Container(
                          width: 29,
                          height: 29,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Theme.of(context).primaryColor),
                          child: const Center(
                            child: Text(
                              "2",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "البيانات الشخصية",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 13),
                        ),
                        const SizedBox(
                          width: 43,
                        ),
                        Text(
                          "بيانات السيارة ",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 13),
                        )
                      ],
                    )
                  ],
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(8),
                          width: 81,
                          height: 71,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: DashedBorder.fromBorderSide(
                              dashLength: 10,
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1),
                            ),
                          ),
                          child: const Center(
                              child: AppImages(
                            url: "camera.png",
                            width: 30,
                            height: 25,
                          )),
                        ),
                        Text(
                          title[index],
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                      ],
                    );
                  },
                ),
                AppInput(
                    url: "car.png",
                    text: "نوع السيارة  ",
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "يجب ادخال    نوع السيارة";
                      }
                      return null;
                    },
                    width: 16,
                    height: 20),
                AppInput(
                    url: "car.png",
                    text: " موديل السيارة",
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "يجب ادخال موديل السيارة";
                      }
                      return null;
                    },
                    width: 16,
                    height: 20),
                AppInput(
                    url: "savemoney.png",
                    text: "رقم الإيبان",
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "يجب ادخال رقم الإيبان صحيح";
                      }
                      return null;
                    },
                    width: 16,
                    height: 20),
                AppInput(
                    url: "bank.png",
                    text: "إسم البنك",
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "يجب ادخال إسم البنك";
                      }
                      return null;
                    },
                    width: 16,
                    height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: values,
                      onChanged: (value) {
                        values = value!;

                        setState(() {});
                      },
                    ),
                    const Text("الموافقة على الشروط والأحكام")
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppButton(
                      text: "تسجيل",
                      onpress: () {
                        if (formKey.currentState!.validate()) {
                          navigateTo(const NewAccountView());
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
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateTo(const ConfirmCodeView());
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
