import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
      EasyLocalization(
          child: MyApp(),
          fallbackLocale: Locale('en'),
          supportedLocales: [Locale('en')],
          path: 'assets/translations'
      )
  );
}
