import 'dart:async';
import 'dart:io';

import 'package:flutter_application_1/views/auth/register/bloc/event.dart';
import 'package:flutter_application_1/views/auth/register/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/dio_helper.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBloc() : super(RegisterStates()) {
    on<RegisterGetEvent>(_getData);
  }

  Future<void> _getData(
    RegisterGetEvent event,
    Emitter<RegisterStates> emit,
  ) async {
    emit(RegisterLoadingStates());
    final response = await DioHelper.send("driver_register", data: {
      "password": event.password,
      "phone": "${event.code}${event.phone}",
      "email": event.email,
      "password_confirmation": event.passwordConfirmation,
      "identity_number": event.identityNumber,
      "device_token": "test",
      "user_type": "client",
      "fullname": "Safaa",
      "city_id": 5,
      "type": Platform.operatingSystem,
    });
    if (response.isSuccess) {
      emit(RegisterSuccessStates(msg: response.msg));
    } else {
      emit(RegisterFailedStates(msg: response.msg));
    }
  }
}
