import 'package:flutter/material.dart';

import '../currencies_list/currencies_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => const CurrenciesListWidget(),
      },
      initialRoute: '/',
    );
  }
}
