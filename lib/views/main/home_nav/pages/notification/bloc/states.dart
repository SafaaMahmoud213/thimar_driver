import '../model/model_notification.dart';

class NotifactionStates {}

class NotifactionLoadingStates extends NotifactionStates {}

class NotifactionSuccessStates extends NotifactionStates {
  final NotificationData list;
  NotifactionSuccessStates({
    required this.list,
  });
}

class NotifactionFailedStates extends NotifactionStates {
  final String msg;
  NotifactionFailedStates({required this.msg});
}
