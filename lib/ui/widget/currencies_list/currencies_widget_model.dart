import 'package:cur_val/domain/currenciesList.dart';
import 'package:flutter/material.dart';

class CurrenciesWidgetModel extends ChangeNotifier {
  final currencies = CurrenciesList.currenciesList.values.toList();
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

  String calculateCurrencies({required int index}) =>
      (currencies[index].currencyRatio(CurrenciesList.currenciesList[currentCurrencyCode]?.rate) *
              (type == "" ? 0 : double.parse(type)))
          .toStringAsFixed(2);

  updateCurrencies() async {
    var rates = await CurrenciesList().getRateList();
    rates.forEach((key, value) {
      CurrenciesList.currenciesList[key]?.rate = value;
    });
    notifyListeners();
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
