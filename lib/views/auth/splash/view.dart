import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/design/app_image.dart';
import 'package:flutter_application_1/views/auth/login/view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/backgr.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: ShakeY(
              child: const AppImages(
                url: "logo1.png",
                width: 173,
                height: 188,
              ),
            ),
          )
        ],
      ),
    );
  }
}
