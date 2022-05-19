import 'package:hive/hive.dart';

class BoxManager {
  static final BoxManager instance = BoxManager._();
  BoxManager._();
  Box<List<String>> selectedCurrenciesBox () => Hive.box<List<String>>('selected_currency');


}
