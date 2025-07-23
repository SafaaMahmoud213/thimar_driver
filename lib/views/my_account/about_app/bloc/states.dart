import '../model/model_aboutapp.dart';

class AboutStates {}

class AboutLoadingState extends AboutStates {}

class AboutSuccessState extends AboutStates {
  final AboutModel list;
  AboutSuccessState({required this.list});
}

class AboutFailedState extends AboutStates {
  final String msg;
  AboutFailedState({required this.msg});
}
