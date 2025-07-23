import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/views/auth/componant/view.dart';
import 'package:flutter_application_1/views/auth/login/view.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../core/design/app_button.dart';
import '../../../core/logic/helper_method.dart';

class ConfirmCodeView extends StatefulWidget {
  const ConfirmCodeView({super.key});

  @override
  State<ConfirmCodeView> createState() => _ConfirmCodeViewState();
}

class _ConfirmCodeViewState extends State<ConfirmCodeView> {
  String code = "";
  TextEditingController? controller;
  int secondsRemaining = 120;
  bool enableResend = false;
  Timer? timer;
  @override
  initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int minutes = (secondsRemaining ~/ 60) % 60;
    int seconds = secondsRemaining % 60;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AuthHeader(
              text1: "نسيت كلمة المرور ",
              text2: "أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال",
            ),
            Row(
              children: [
                const Text(
                  "9660548745 ",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff707070),
                      fontWeight: FontWeight.normal),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "تغيير رقم الجوال",
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            PinCodeFields(
              controller: controller,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(16),
              onComplete: (value) {
                code = value;
              },
              length: 4,
              borderRadius: BorderRadius.circular(20.0),
              fieldBorderStyle: FieldBorderStyle.square,
              fieldHeight: 60.0,
              fieldWidth: 70.0,
              borderWidth: 2.0,
              activeBorderColor: Theme.of(context).primaryColor,
              activeBackgroundColor: Colors.white,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              autoHideKeyboard: false,
              fieldBackgroundColor: Colors.white,
              borderColor: Colors.white,
            ),
            const SizedBox(height: 8),
            AppButton(
                text: "تأكيد الكود",
                width: 343,
                onpress: () {
                  navigateTo(const LoginView());
                },
                height: 60),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                "لم تستلم الكود ؟",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff707070)),
              ),
            ),
            const Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                "يمكنك إعادة إرسال الكود بعد",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff707070)),
              ),
            ),
            CircularPercentIndicator(
              radius: 30.0,
              lineWidth: 5.0,
              percent: secondsRemaining / 120,
              center: Text(
                  '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}'),
              progressColor: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 133,
              height: 47,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Theme.of(context).primaryColor)),
              child: const Center(
                child: Text(
                  "إعادة الإرسال",
                  style: TextStyle(fontSize: 15),
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
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "تسجيل الدخول ",
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
    );
  }
}
