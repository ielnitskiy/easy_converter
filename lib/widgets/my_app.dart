import 'package:easy_converter/screen/reorderable_currency/reorderable_currency.dart';
import 'package:easy_converter/screen/select_currency/select_curriencies.dart';
import 'package:easy_converter/screen/settings/settings.dart';
import 'package:easy_converter/screen/view_currency/view_currencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
        shadowColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      routes: {
        '/': (context) => const ViewCurrenciesListWidget(),
        '/select_currency': (context) => const SelectCurrenciesListWidget(),
        '/reorderable_currency': (context) => const ReorderableCurrencyWidget(),
        '/settings': (context) => const SettingsScreenWidget(),
      },
      initialRoute: '/',
    );
  }
}
