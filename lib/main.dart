import 'package:cur_val/ui/widget/currencies_list/currencies_widget_model.dart';
import 'package:flutter/material.dart';

import 'ui/widget/app/my_app.dart';

void main() {
  const app = MyApp();
  CurrenciesWidgetModel().updateCurrencies();
  runApp(app);
}
