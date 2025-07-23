import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/design/app_loading.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double? width, height;
  final VoidCallback? onpress;
  final bool isLoading;
  const AppButton(
      {super.key,
      required this.text,
      this.width,
      this.height,
      this.onpress,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      const AppLoading();
    }
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12)),
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: const Color(0xff4C8613),
        ),
        onPressed: onpress,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
