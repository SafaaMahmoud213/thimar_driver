import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void navigateTo(Widget page, {bool keepHistory = true}) {
  Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => keepHistory);
}

void showMessage(String msg, {bool isSuccess = false}) {
  if (msg.isNotEmpty) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: isSuccess ? Colors.green : Colors.red,
      ),
    );
  }
}
