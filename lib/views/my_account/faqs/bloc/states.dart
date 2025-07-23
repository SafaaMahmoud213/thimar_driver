import '../model/faqs_model.dart';

class FAQSStates {}

class FAQSLoadingStates extends FAQSStates {}

class FAQSSuccessStates extends FAQSStates {
  final List<FAQSModel> list;
  FAQSSuccessStates({required this.list});
}

class FAQSFailedStates extends FAQSStates {
  final String msg;
  FAQSFailedStates({required this.msg});
}
