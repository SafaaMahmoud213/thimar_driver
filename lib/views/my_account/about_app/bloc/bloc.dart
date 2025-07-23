import 'package:flutter_application_1/views/my_account/about_app/bloc/event.dart';
import 'package:flutter_application_1/views/my_account/about_app/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/dio_helper.dart';
import '../model/model_aboutapp.dart';

class AboutBloc extends Bloc<AboutEvents, AboutStates> {
  AboutBloc() : super(AboutStates()) {
    on<GetAboutEvents>(_getData);
  }

  Future<void> _getData(
    GetAboutEvents event,
    Emitter<AboutStates> emit,
  ) async {
    emit(AboutLoadingState());
    final response = await DioHelper.get("about");
    if (response.isSuccess) {
      final model = AboutData.fromJson(response.data);
      emit(AboutSuccessState(list: model.data));
    } else {
      emit(AboutFailedState(msg: response.msg));
    }
  }
}
