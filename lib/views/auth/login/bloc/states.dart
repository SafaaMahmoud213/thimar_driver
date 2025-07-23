import 'package:flutter_application_1/core/logic/helper_method.dart';

class LoginStates {}

class LoginLoadingStates extends LoginStates {}

class LoginSuccessStates extends LoginStates {
  final String msg;
  LoginSuccessStates({required this.msg}) {
    showMessage(msg, isSuccess: true);
  }
}

class LoginFailedStates extends LoginStates {
  final String msg;
  LoginFailedStates({required this.msg}) {
    showMessage(msg);
  }
}
