import '../model/model_privacy.dart';

class PrivacyStates {}

class PrivacyLoadingState extends PrivacyStates {}

class PrivacySuccessState extends PrivacyStates {
  final PrivacyModel list;
  PrivacySuccessState({required this.list});
}

class PrivacyFailedState extends PrivacyStates {
  final String msg;
  PrivacyFailedState({required this.msg});
}
