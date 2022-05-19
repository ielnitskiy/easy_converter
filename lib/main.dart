import 'package:cur_val/domain/selected_currencies.dart';
import 'package:cur_val/ui/widget/view_currency_list/view_currencies_list_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/services.dart';

import 'ui/widget/app/my_app.dart';

const selectedCurrency = 'selected_currency';
const rate = 'rate';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(rate);
  ViewCurrenciesListWidgetModel().updateRateCurrencies();
  await Hive.openBox<List<String>>(selectedCurrency);
  if (Hive.box<List<String>>(selectedCurrency).get("selectedList") != null) {
    SelectedCurrencies.selectedCurrencies = Hive.box<List<String>>(selectedCurrency).get("selectedList")!;
  }
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  const app = MyApp();
  runApp(app);
}
