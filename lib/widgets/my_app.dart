import 'package:easy_converter/screen/select_currency/select_curriencies.dart';
import 'package:easy_converter/screen/settings/settings.dart';
import 'package:easy_converter/screen/view_currency/view_currencies.dart';
import 'package:easy_converter/widgets/util/const.dart';
import 'package:easy_converter/widgets/util/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      routes: {
        AppRoutes.viewCurrencies: (context) => const ViewCurrenciesListWidget(),
        AppRoutes.selectCurrency: (context) => const SelectCurrenciesListWidget(),
        AppRoutes.settings: (context) => const SettingsScreenWidget(),
      },
      initialRoute: AppRoutes.viewCurrencies,
    );
  }
}


