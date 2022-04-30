import 'package:cur_val/domain/all_currencies_list.dart';
import 'package:flutter/material.dart';

import '../../../domain/selected_currencies.dart';

class CurrenciesWidgetModel extends ChangeNotifier {
  final currencies = AllCurrenciesList.allCurrenciesList.values.toList();


  static String _currentCurrency = "USD";
  static String _type = "";

  set currentCurrencyCode(String currency) {
    _currentCurrency = currency;
    notifyListeners();
  }

  String get currentCurrencyCode => _currentCurrency;

  set type(String number) {
    _type = number.toString();
    notifyListeners();
  }

  String get type => _type;

  String calculateCurrencies({required int index}) => ((currencies
              .firstWhere((element) => element.code == SelectedCurrencies.selectedCurrencies[index])
              .currencyRatio(AllCurrenciesList.allCurrenciesList[currentCurrencyCode]?.rate) *
          (type == "" ? 0 : double.parse(type))))
      .toStringAsFixed(2);

  updateCurrencies() async {
    var rates = await AllCurrenciesList().getRateList();
    rates.forEach((key, value) {
      AllCurrenciesList.allCurrenciesList[key]?.rate = value;
    });
    notifyListeners();
  }

  List getSelectedCurrencies() {
    return SelectedCurrencies.selectedCurrencies;
  }
}

class CurrenciesWidgetModelProvider extends InheritedNotifier {
  final CurrenciesWidgetModel model;

  const CurrenciesWidgetModelProvider({
    required this.model,
    Key? key,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);

  static CurrenciesWidgetModelProvider of(BuildContext context) {
    final CurrenciesWidgetModelProvider? result =
        context.dependOnInheritedWidgetOfExactType<CurrenciesWidgetModelProvider>();
    assert(result != null, 'No CurrenciesListWidgetModelProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CurrenciesWidgetModelProvider old) {
    return true;
  }
}
