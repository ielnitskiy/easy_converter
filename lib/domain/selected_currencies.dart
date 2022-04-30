
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class SelectedCurrencies {
  @HiveField(0)
  static List<String> selectedCurrencies = [];
}
