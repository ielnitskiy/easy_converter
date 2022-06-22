import 'package:easy_converter/domain/all_currencies_list.dart';
import 'package:easy_converter/domain/rate_currencies.dart';
import 'package:easy_converter/library/hive/box_manager.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/selected_currencies.dart';

class ViewCurrenciesModel with ChangeNotifier {
  final currencies = AllCurrenciesList.allCurrenciesList;

  ViewCurrenciesModel() {
    _setup();
  }

  static String _currentCurrency = "USD";
  static String _type = "";

  set currentCurrencyCode(String currency) {
    _currentCurrency = currency;
    notifyListeners();
  }

  String get currentCurrencyCode => _currentCurrency;

  set type(String number) {
    _type = number;
    notifyListeners();
  }

  String get type => _type;

//FIXME избавиться от опционала
  String calculateCurrencies({required int index}) => ((currencies[SelectedCurrencies.selectedCurrencies[index]]!
              .currencyRatio(AllCurrenciesList.allCurrenciesList[currentCurrencyCode]?.rate) *
          (type == "" ? 0 : double.parse(type))))
      .toStringAsFixed(2);

  updateRateCurrencies() async {
    Map<dynamic, dynamic> rates = {};
    var ratesBox = Hive.box('rate');
    try {
      rates = await RateCurrencies().getRateList();
    } catch (e) {
      rates = ratesBox.toMap();
    }

    rates.forEach((key, value) {
      ratesBox.put(key, value);
      AllCurrenciesList.allCurrenciesList[key]?.rate = value;
    });
    notifyListeners();
  }

  List getSelectedCurrencies() {
    return SelectedCurrencies.selectedCurrencies;
  }

  deleteCurrency({required int index}) {
    Box<List<String>> selectedCurrenciesBox = Hive.box<List<String>>('selected_currency');

    if (selectedCurrenciesBox.get("selectedList")!.remove(getSelectedCurrencies()[index]))
      ;
    else {
      return;
    }
    notifyListeners();
  }

  Future<void> _setup() async {
    await BoxManager.instance.openSelectCurBox();
    List<String>? list = Hive.box<List<String>>('selected_currency').get("selectedList");
    if (list == null) {
      SelectedCurrencies.selectedCurrencies = [];
    } else
      SelectedCurrencies.selectedCurrencies = list;
    notifyListeners();
  }

  reorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final String item = SelectedCurrencies.selectedCurrencies.removeAt(oldIndex);
    SelectedCurrencies.selectedCurrencies.insert(newIndex, item);
    notifyListeners();
  }
}
