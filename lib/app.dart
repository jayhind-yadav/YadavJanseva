import 'package:flutter/material.dart';
import 'package:yjs_kendra/screens/home_screen.dart';
import 'package:yjs_kendra/theme_config.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    theme: themeData(ThemeConfig.lightTheme),
      );
  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
    );
  }
}
