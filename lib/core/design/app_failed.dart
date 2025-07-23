import 'package:flutter/material.dart';

class Appfailed extends StatelessWidget {
  final String msg;
  const Appfailed({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      msg,
      style: const TextStyle(color: Colors.black),
    ));
  }
}
