import 'package:cur_val/domain/all_currencies_list.dart';
import 'package:cur_val/domain/currency.dart';
import 'package:cur_val/domain/rate_currencies.dart';
import 'package:cur_val/library/hive/box_manager.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/selected_currencies.dart';

class ViewCurrenciesListWidgetModel extends ChangeNotifier {
  final currencies = AllCurrenciesList.allCurrenciesList;

  ViewCurrenciesListWidgetModel() {
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

  String _searchRequest = '';

  String get searchRequest => _searchRequest;

  set searchRequest(String searchRequest) {
    _searchRequest = searchRequest;
    notifyListeners();
  }

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

  //
  // selectCurrency({required int index}) {
  //   Box<List<String>> selectedCurrenciesBox = Hive.box<List<String>>('selected_currency');
  //   if (selectedCurrenciesBox.get("selectedList")!.remove(currencies[index].code)) {
  //   } else {
  //     return;
  //   }
  //   notifyListeners();
  // }

  deleteCurrency({required int index}) {
    Box<List<String>> selectedCurrenciesBox = Hive.box<List<String>>('selected_currency');

    if (selectedCurrenciesBox.get("selectedList")!.remove(getSelectedCurrencies()[index]))
      ;
    else {
      return;
    }
    notifyListeners();
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

class ViewCurrenciesListWidgetModelProvider extends InheritedNotifier {
  final ViewCurrenciesListWidgetModel model;

  const ViewCurrenciesListWidgetModelProvider({
    required this.model,
    Key? key,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);

  static ViewCurrenciesListWidgetModelProvider of(BuildContext context) {
    final ViewCurrenciesListWidgetModelProvider? result =
        context.dependOnInheritedWidgetOfExactType<ViewCurrenciesListWidgetModelProvider>();
    assert(result != null, 'No CurrenciesListWidgetModelProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ViewCurrenciesListWidgetModelProvider old) {
    return true;
  }
}
