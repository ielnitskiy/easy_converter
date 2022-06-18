import 'package:cur_val/domain/all_currencies_list.dart';
import 'package:cur_val/domain/currency.dart';
import 'package:cur_val/domain/selected_currencies.dart';
import 'package:cur_val/library/hive/box_manager.dart';
import 'package:flutter/material.dart';

class SelectCurrenciesModel with ChangeNotifier {
  final currencies = AllCurrenciesList.allCurrenciesList;

  String _searchRequest = '';

  String get searchRequest => _searchRequest;

  set searchRequest(String searchRequest) {
    _searchRequest = searchRequest;
    notifyListeners();
  }

  selectCurrency({required String code}) {
    //FiXME избавиться от опциоанал
    if (SelectedCurrencies.selectedCurrencies.remove(code)) {
    } else {
      SelectedCurrencies.selectedCurrencies.add(code);
    }
    BoxManager.instance.putSelectedCurList(SelectedCurrencies.selectedCurrencies);
    notifyListeners();
  }

  List<Currency> resultSearch() {
    //TODO причесать метод
    if (searchRequest.isEmpty) {
      //FIXME лист обновлется кучу раз
      List<Currency> cur = currencies.values.toList();
      return cur;
    } else {
      List<Currency> resultSearch =
          currencies.values.where((element) => _searchForElement(element, searchRequest)).cast<Currency>().toList();
      return resultSearch;
    }
  }

  bool _searchForElement(Currency element, String searchRequest) {
    if (element.title.toLowerCase().contains(searchRequest.toLowerCase())) {
      return true;
    } else if (element.country.toLowerCase().contains(searchRequest.toLowerCase())) {
      return true;
    } else if (element.code.toLowerCase().contains(searchRequest.toLowerCase())) {
      return true;
    } else {
      return false;
    }
  }
}
