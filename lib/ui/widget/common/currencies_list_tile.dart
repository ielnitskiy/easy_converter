import 'package:flutter/material.dart';

import '../../../domain/selected_currencies.dart';
import '../currencies_list/currencies_widget_model.dart';

class CurrenciesListTile extends StatelessWidget {
  int index;
  Key key;
  final CurrenciesWidgetModel model;
  final Widget? trailing;

  CurrenciesListTile({
    required this.index,
    required this.key,
    required this.model,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedCurrencies = SelectedCurrencies.selectedCurrencies;

    return ListTile(
      leading: Text(model.currencies.firstWhere((element) => element.code == selectedCurrencies[index]).icon),
      title: Text(model.currencies.firstWhere((element) => element.code == selectedCurrencies[index]).code),
      subtitle: Text(model.currencies.firstWhere((element) => element.code == selectedCurrencies[index]).title),
      trailing: trailing,
    );
  }
}
