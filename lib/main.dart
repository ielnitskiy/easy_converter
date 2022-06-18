import 'package:cur_val/domain/selected_currencies.dart';
import 'package:cur_val/screen/view_currency/view_currencies_list_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/services.dart';

import 'widgets/my_app.dart';

const selectedCurrency = 'selected_currency';
const rate = 'rate';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(rate);
  ViewCurrenciesListWidgetModel().updateRateCurrencies();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  const app = MyApp();
  runApp(app);
}
