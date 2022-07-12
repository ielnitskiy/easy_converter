import 'package:easy_converter/resources/resources.dart';

class Currency {
  String flag;
  final String code;
  final String country;
  final String title;
  final String? symbol;
  num rate;

  Currency({
    this.flag = SvgsFlags.none,
    required this.code,
    required this.country,
    required this.title,
    this.symbol,
    this.rate =0,
  });

  num currencyRatio(num currency) {
    if (rate == 0 || currency == 0) {
      return 0;
    }
    return rate / currency;
  }
}
