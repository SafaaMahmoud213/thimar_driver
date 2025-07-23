import 'dart:async';

import 'package:flutter_application_1/views/main/home_nav/pages/home/bloc/event.dart';
import 'package:flutter_application_1/views/main/home_nav/pages/home/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/logic/dio_helper.dart';
import '../model/model_home.dart';

class HomeBloc extends Bloc<EventHome, HomeStates> {
  HomeBloc() : super(HomeStates()) {
    on<GetEventHome>(_getData);
  }

  Future<void> _getData(
    GetEventHome event,
    Emitter<HomeStates> emit,
  ) async {
    emit(HomeLoadingStates());
    final response = await DioHelper.get("driver/search?keyword=C");
    if (response.isSuccess) {
      final model = HomeData.fromJson(response.data);
      emit(HomeSuccessStates(list: model.list));
    } else {
      HomeFailedStates(msg: response.msg);
    }
  }
}
