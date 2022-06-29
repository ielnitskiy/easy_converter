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

  putSelectedCurList(List<String> list) {
    Hive.box<List<String>>(BoxManager.selectedCurrency).put(BoxManager.selectedList, list);
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
