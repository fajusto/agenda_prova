import 'package:agenda_prova/modules/contacts/views/contacts.dart';
import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppTheme.primaryColor,
        primaryColorDark: AppTheme.appColor,
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(AppTheme.appColor),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppTheme.appBarColor,
          foregroundColor: AppTheme.appColor,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(0xff40590a, AppTheme.primarySwatch),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppTheme.primaryColor,
          foregroundColor: AppTheme.appColor,
        ),
      ),
      home: const ContactsPage(),
    );
  }
}
