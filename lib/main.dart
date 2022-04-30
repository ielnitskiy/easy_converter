import 'package:cur_val/ui/widget/currencies_list/currencies_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'ui/widget/app/my_app.dart';

void main() async {
  const app = MyApp();
  CurrenciesWidgetModel().updateCurrencies();
  await Hive.initFlutter();
  runApp(app);
}
