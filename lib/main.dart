import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/logic/cache_helper.dart';
import 'package:flutter_application_1/core/logic/helper_method.dart';
import 'package:flutter_application_1/views/kiwi.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'views/main/home_nav/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPreferences.getInstance();
  await CachHelper().getToken();
  initKiwi();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale("ar"),
      saveLocale: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          // App Entry Point
          return MaterialApp(
            navigatorKey: navigatorKey,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Thimar',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xff4C8613),
                primary: const Color(0xff4C8613),
              ),
              useMaterial3: true,
              filledButtonTheme: FilledButtonThemeData(
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: const Color(0xff4C8613),
                ),
              ),
            ),
            home: child,
          );
        },
        child: const HomeNavView());
  }
}
