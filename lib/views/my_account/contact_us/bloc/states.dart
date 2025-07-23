import '../model/model_contact_us.dart';

class ContactUsStates {}

class ContactUsLoadingStates extends ContactUsStates {}

class ContactUsSuccessStates extends ContactUsStates {
  final ContactUsModel list;
  ContactUsSuccessStates({required this.list});
}

class ContactUsFailedStates extends ContactUsStates {
  final String msg;
  ContactUsFailedStates({required this.msg});
}
