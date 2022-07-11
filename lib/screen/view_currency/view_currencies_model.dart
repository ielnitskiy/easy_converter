import 'package:easy_converter/domain/all_currencies_list.dart';
import 'package:easy_converter/domain/rate_currencies.dart';
import 'package:easy_converter/library/hive/box_manager.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

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
  String calculateCurrencies({required int index}) {
    var currentCurrency = currencies[SelectedCurrencies.selectedCurrencies[index]];
    var currencyRate = currentCurrency!.currencyRatio(AllCurrenciesList.allCurrenciesList[currentCurrencyCode]!.rate);
    var num = currencyRate * (type == "" ? 0 : double.parse(type));

    return NumberFormat("#,##0.00").format(num).replaceAll(',', ' ').toString();
  }

  updateRateCurrencies() async {
    // вообще, почти весь код отсюда (загрузка данных из апи, созранение в бд) - это то, что обычно делает репозиторий.
    // Репозиторий - это прослойка между источниками данных и слоем бизнес-логики.
    // он позволяет абстрагироваться от того, как мы получаем данные, как источники взаимодействуют между собой.
    Map<dynamic, dynamic> rates = {};
    var ratesBox = Hive.box('rate');
    try {
      // такие переменные, как RateCurrencies(), BoxManager.instance, AllCurrenciesList.allCurrenciesList, SelectedCurrencies.selectedCurrencies
      // нельзя будет замокать, когда будешь писать тесты.
      // Правильней всего передавать зависимости класса через конструктор, а вызов конструктора делать в отдельном классе,
      // который будет отвечать только за dependency injection.
      // В тт у нас такой класс называется <smth>_module.dart, а для di мы используем GetIt. Правда,
      // в тт мы передаем зависимости не через конструктор, а инициализируем переменные класса с помощью DI.get(),
      // но нам так удобней и особо минусов мы не нашли.
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

  //TODO перенести листы в переменную
  deleteCurrency({required int index}) {
    // лучше не тянуть в этот слой хайв, как я уже писал в комментах к бокс менеджеру.
    Box<List<String>> selectedCurrenciesBox = Hive.box<List<String>>('selected_currency');

    // всегда нужно использовать константы вместо строк. в 1 месте поменяешь строку, в другом забудешь
    if (selectedCurrenciesBox.get("selectedList")!.remove(getSelectedCurrencies()[index])) {
      BoxManager.instance.putSelectedCurList(SelectedCurrencies.selectedCurrencies);
    } else {
      return;
    }
    notifyListeners();
  }

  //TODO перенести листы в переменную
  Future<void> _setup() async {
    await BoxManager.instance.openSelectCurBox();
    List<String>? list = Hive.box<List<String>>('selected_currency').get("selectedList");
    if (list == null) {
      SelectedCurrencies.selectedCurrencies = ['USD'];
      BoxManager.instance.putSelectedCurList(SelectedCurrencies.selectedCurrencies);
    } else
      SelectedCurrencies.selectedCurrencies = list;
    notifyListeners();
  }

  reorder(int oldIndex, int newIndex) {
    final String item = SelectedCurrencies.selectedCurrencies.removeAt(oldIndex);
    SelectedCurrencies.selectedCurrencies.insert(newIndex, item);
    BoxManager.instance.putSelectedCurList(SelectedCurrencies.selectedCurrencies);
    notifyListeners();
  }
}
