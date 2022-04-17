import 'package:cur_val/domain/currencies_all.dart';
import 'package:flutter/material.dart';

class CurrenciesWidgetModel extends ChangeNotifier {
  final currencies = CurrenciesAll.currenciesAll.values.toList();

  static String _currentCurrency = "USD";

  set currentCurrencyCode(String currency) {
    _currentCurrency = currency;
    notifyListeners();
  }

  String get currentCurrencyCode => _currentCurrency;

  static String _type = "";

  set type(String number) {
    _type = number.toString();
    notifyListeners();
  }

  String get type => _type;
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
