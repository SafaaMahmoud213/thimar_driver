import 'package:flutter_application_1/views/my_account/suggestions/bloc/event.dart';
import 'package:flutter_application_1/views/my_account/suggestions/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/dio_helper.dart';

class SuggestionsBloc extends Bloc<SuggestionEvents, SuggestionsStates> {
  SuggestionsBloc() : super(SuggestionsStates()) {
    on<GetSuggestionEvents>(_getData);
  }

  Future<void> _getData(
    GetSuggestionEvents event,
    Emitter<SuggestionsStates> emit,
  ) async {
    emit(SuggestionsLoadingState());
    final response = await DioHelper.send("contact", data: {
      "fullname": event.name,
      "phone": event.phone,
      "title": event.title,
      "content": "test test",
    });
    if (response.isSuccess) {
      emit(SuggestionsSuccessState(msg: response.msg));
    } else {
      emit(SuggestionsFailedState(msg: response.msg));
    }
  }
}
