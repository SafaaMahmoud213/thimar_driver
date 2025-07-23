import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String text1, text2;
  const AuthHeader({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
              child: Image.asset(
                "assets/images/logo1.png",
                width: 130,
                height: 125,
              ),
            ),
          ),
          Text(
            text1,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff4C8613),
            ),
          ),
          Text(text2),
        ],
      ),
    );
  }
}
