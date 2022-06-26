import 'package:easy_converter/domain/all_currencies_list.dart';
import 'package:easy_converter/domain/rate_currencies.dart';
import 'package:easy_converter/library/hive/box_manager.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/selected_currencies.dart';

class CurrencyReorderableModel with ChangeNotifier {
  final currencies = AllCurrenciesList.allCurrenciesList;

  List getSelectedCurrencies() {
    return SelectedCurrencies.selectedCurrencies;
  }

  deleteCurrency({required int index}) {
    Box<List<String>> selectedCurrenciesBox = Hive.box<List<String>>('selected_currency');

    if (selectedCurrenciesBox.get("selectedList")!.remove(getSelectedCurrencies()[index])) {
      BoxManager.instance.putSelectedCurList(SelectedCurrencies.selectedCurrencies);
    } else {
      return;
    }
    notifyListeners();
  }

  reorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final String item = SelectedCurrencies.selectedCurrencies.removeAt(oldIndex);
    SelectedCurrencies.selectedCurrencies.insert(newIndex, item);
    BoxManager.instance.putSelectedCurList(SelectedCurrencies.selectedCurrencies);
    notifyListeners();
  }
}
