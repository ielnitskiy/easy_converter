import 'package:easy_converter/screen/view_currency/view_currencies_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'widgets/my_app.dart';

const rate = 'rate';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(rate);
  ViewCurrenciesModel().updateRateCurrencies();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  const app = MyApp();
  runApp(app);
}
