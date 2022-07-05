import 'package:hive/hive.dart';

class BoxManager {
  static final BoxManager instance = BoxManager._();
  static final String selectedCurrency = 'selected_currency';
  static final String selectedList = 'selectedList';
  static final String rate = 'rate';

  BoxManager._();

  // следующие два метода не используется.
  // вообще, хорошо бы делать import 'package:hive' только тут, а в остальных местах работать с хайвом через этот класс.
  // сейчас, например, я сначала не понял, где вообще открывается бокс рейтов, а окзывается - в мейне.
  // лучше сделать у BoxManager метод init() и в нем все боксы открыть, а уже инит вызывать в мейне.
  // также боксы снаружи не должны быть видны, а доступ к содержимому бд идет через методы аксессоры.
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
