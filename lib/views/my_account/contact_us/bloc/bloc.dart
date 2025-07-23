import 'package:flutter_application_1/views/my_account/contact_us/bloc/event.dart';
import 'package:flutter_application_1/views/my_account/contact_us/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/dio_helper.dart';
import '../model/model_contact_us.dart';

class ContactUsBloc extends Bloc<ContactUsEvents, ContactUsStates> {
  ContactUsBloc() : super(ContactUsStates()) {
    on<GetContactUsEvent>(_getData);
  }

  Future<void> _getData(
    GetContactUsEvent event,
    Emitter<ContactUsStates> emit,
  ) async {
    emit(ContactUsLoadingStates());
    final response = await DioHelper.get("contact");
    if (response.isSuccess) {
      final model = ContactUsData.fromJson(response.data);
      emit(ContactUsSuccessStates(list: model.list));
    } else {
      emit(ContactUsFailedStates(msg: response.msg));
    }
  }
}
