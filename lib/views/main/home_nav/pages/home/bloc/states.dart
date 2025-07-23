import '../model/model_home.dart';

class HomeStates {}

class HomeLoadingStates extends HomeStates {}

class HomeSuccessStates extends HomeStates {
  final List<HomeModel> list;
  HomeSuccessStates({
    required this.list,
  });
}

class HomeFailedStates extends HomeStates {
  final String msg;
  HomeFailedStates({required this.msg});
}
