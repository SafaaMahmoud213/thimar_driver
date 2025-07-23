import 'package:flutter_application_1/views/my_account/privacy/bloc/event.dart';
import 'package:flutter_application_1/views/my_account/privacy/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/dio_helper.dart';
import '../model/model_privacy.dart';

class PrivacyBloc extends Bloc<PrivacyEvents, PrivacyStates> {
  PrivacyBloc() : super(PrivacyStates()) {
    on<GetPrivacyEvents>(_getData);
  }

  Future<void> _getData(
    GetPrivacyEvents event,
    Emitter<PrivacyStates> emit,
  ) async {
    emit(PrivacyLoadingState());
    final response = await DioHelper.get("policy");
    if (response.isSuccess) {
      final model = PrivacyData.fromJson(response.data);
      emit(PrivacySuccessState(list: model.data));
    } else {
      emit(PrivacyFailedState(msg: response.msg));
    }
  }
}
