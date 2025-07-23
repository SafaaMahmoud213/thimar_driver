import 'package:flutter_application_1/core/logic/helper_method.dart';

class RegisterStates {}

class RegisterLoadingStates extends RegisterStates {}

class RegisterSuccessStates extends RegisterStates {
  final String msg;
  RegisterSuccessStates({required this.msg}) {
    showMessage(msg, isSuccess: true);
  }
}

class RegisterFailedStates extends RegisterStates {
  final String msg;
  RegisterFailedStates({required this.msg}) {
    showMessage(msg);
  }
}
