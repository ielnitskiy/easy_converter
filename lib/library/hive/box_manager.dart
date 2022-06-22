import 'package:easy_converter/domain/selected_currencies.dart';
import 'package:hive/hive.dart';

class BoxManager {
  static final BoxManager instance = BoxManager._();
  static final String selectedCurrency = 'selected_currency';
  static final String selectedList = 'selectedList';

  BoxManager._();

  Future<Box> openRateBox() async {
    return _openBox('rate');
  }

  Future<Box<List<String>>> openSelectCurBox() async {
    return _openBox('selected_currency');
  }

  // List<String> getSelectedCurList() {
  //
  //   selectedCurrenciesBox = Hive.box<List<String>>('selected_currency');
  //   if (selectedCurrenciesBox.get("selectedList") == null) {
  //     (selectedCurrenciesBox.put("selectedList", SelectedCurrencies.selectedCurrencies));
  //   }
  //
  //
  //   var selectedList = Hive.box<List<String>>(BoxManager.selectedCurrency).get(BoxManager.selectedList);
  //   if (selectedList != null) {
  //     Hive.box<List<String>>(BoxManager.selectedCurrency)
  //         .put(BoxManager.selectedList, SelectedCurrencies.selectedCurrencies);
  //     selectedList = Hive.box<List<String>>(BoxManager.selectedCurrency).get(BoxManager.selectedList);
  //   }
  //   return selectedList!;
  // }

  putSelectedCurList(List<String> list) {
    Hive.box<List<String>>(BoxManager.selectedCurrency)
        .put(BoxManager.selectedList, list);
  }

  Future<Box<T>> _openBox<T>(
    String name,
  ) async {
    if (Hive.isBoxOpen(name)) {
      return await Hive.box(name);
    }
    return await Hive.openBox<T>(name);
  }

  Future<void> closeBox<T>(Box<T> box) async {
    if (box.isOpen) {
      await box.close();
    }
  }
}
