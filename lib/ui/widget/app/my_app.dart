import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../select_curriencies_list/select_curriencies_list.dart';
import '../view_currency_list/view_currencies_list.dart';

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
      title: 'Flutter Demo',
      routes: {
        '/': (context) => const ViewCurrenciesListWidget(),
        '/select_currency': (context) => const SelectCurrenciesListWidget(),
      },
      initialRoute: '/',
    );
  }
}
