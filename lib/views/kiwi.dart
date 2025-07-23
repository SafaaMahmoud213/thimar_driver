import 'package:flutter_application_1/views/auth/login/bloc/bloc.dart';
import 'package:flutter_application_1/views/auth/register/bloc/bloc.dart';
import 'package:kiwi/kiwi.dart';

import 'main/home_nav/pages/home/bloc/bloc.dart';
import 'main/home_nav/pages/notification/bloc/bloc.dart';
import 'my_account/about_app/bloc/bloc.dart';
import 'my_account/contact_us/bloc/bloc.dart';
import 'my_account/faqs/bloc/bloc.dart';
import 'my_account/privacy/bloc/bloc.dart';
import 'my_account/suggestions/bloc/bloc.dart';

void initKiwi() {
  final container = KiwiContainer();
  container.registerFactory((container) => LoginBloc());
  container.registerFactory((container) => RegisterBloc());
  container.registerFactory((container) => NotificationBloc());
  container.registerFactory((container) => AboutBloc());
  container.registerFactory((container) => PrivacyBloc());
  container.registerFactory((container) => FAQSBloc());
  container.registerFactory((container) => ContactUsBloc());
  container.registerFactory((container) => SuggestionsBloc());
  container.registerFactory((container) => HomeBloc());
}
