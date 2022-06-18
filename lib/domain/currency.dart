import 'package:cur_val/resources/resources.dart';

class Currency {
  String flag;
  final String code;
  final String country;
  final String title;
  final String? symbol;
  num? rate;

  Currency({
    this.flag = Svgs.none,
    required this.code,
    required this.country,
    required this.title,
    this.symbol,
    this.rate,
  });

  num currencyRatio(num? currency) {
    //TODO remove division by zero
    num a = (rate ?? 0) / (currency ?? 0);
    if (a.isNaN) {
      return 0;
    } else if (a == a.toInt()) {
      return a.toInt();
    }
    return a;
  }
}
