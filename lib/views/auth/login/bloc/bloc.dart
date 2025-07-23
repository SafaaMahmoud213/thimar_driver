// import 'package:flutter_application_1/views/auth/login/bloc/event.dart';
// import 'package:flutter_application_1/views/auth/login/bloc/states.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/logic/dio_helper.dart';

import 'dart:async';
import 'dart:io';

import 'package:flutter_application_1/views/auth/login/bloc/event.dart';
import 'package:flutter_application_1/views/auth/login/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/cache_helper.dart';
import '../../../../core/logic/dio_helper.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc() : super(LoginStates()) {
    on<LoginLGetEvent>(_sendData);
  }

  Future<void> _sendData(
    LoginLGetEvent event,
    Emitter<LoginStates> emit,
  ) async {
    emit(LoginLoadingStates());
    final response = await DioHelper.send("login", data: {
      "password": event.password,
      "phone": "${event.code}${event.phone}",
      "device_token": "test",
      "user_type": "client",
      "type": Platform.operatingSystem,
    });
    if (response.isSuccess) {
      CachHelper().setToken(token: response.data["data"]["token"]);
      emit(LoginSuccessStates(msg: response.msg));
    } else {
      emit(LoginFailedStates(msg: response.msg));
    }
  }
}
