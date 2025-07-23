import '../../../../core/logic/helper_method.dart';

class SuggestionsStates {}

class SuggestionsLoadingState extends SuggestionsStates {}

class SuggestionsSuccessState extends SuggestionsStates {
  final String msg;
  SuggestionsSuccessState({required this.msg}) {
    showMessage(msg, isSuccess: true);
  }
}

class SuggestionsFailedState extends SuggestionsStates {
  final String msg;
  SuggestionsFailedState({required this.msg}) {
    showMessage(msg);
  }
}
