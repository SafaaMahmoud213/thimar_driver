import 'dart:async';

import 'package:flutter_application_1/core/logic/dio_helper.dart';
import 'package:flutter_application_1/views/main/home_nav/pages/notification/bloc/event.dart';
import 'package:flutter_application_1/views/main/home_nav/pages/notification/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/model_notification.dart';

class NotificationBloc extends Bloc<NotificationEvents, NotifactionStates> {
  NotificationBloc() : super(NotifactionStates()) {
    on<GetNotificationEvents>(_getnoti);
  }

  Future<void> _getnoti(
    GetNotificationEvents event,
    Emitter<NotifactionStates> emit,
  ) async {
    emit(NotifactionLoadingStates());
    final response = await DioHelper.get("notifications");
    if (response.isSuccess) {
      final model = NotificationModel.fromJson(response.data);
      emit(NotifactionSuccessStates(list: model.data));
    } else {
      NotifactionFailedStates(msg: response.msg);
    }
  }
}
