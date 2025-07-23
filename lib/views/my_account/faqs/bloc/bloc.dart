import 'package:flutter_application_1/views/my_account/faqs/bloc/event.dart';
import 'package:flutter_application_1/views/my_account/faqs/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/dio_helper.dart';
import '../model/faqs_model.dart';

class FAQSBloc extends Bloc<FAQSEvents, FAQSStates> {
  FAQSBloc() : super(FAQSStates()) {
    on<GetFAQSEvent>(_getData);
  }

  Future<void> _getData(
    GetFAQSEvent event,
    Emitter<FAQSStates> emit,
  ) async {
    emit(FAQSLoadingStates());
    final response = await DioHelper.get("faqs");
    if (response.isSuccess) {
      final model = FAQSData.fromJson(response.data);
      emit(FAQSSuccessStates(list: model.list));
    } else {
      emit(FAQSFailedStates(msg: response.msg));
    }
  }
}
