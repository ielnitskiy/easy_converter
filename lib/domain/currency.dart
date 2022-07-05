import 'package:easy_converter/resources/resources.dart';

class Currency {
  String flag;
  final String code;
  final String country;
  final String title;
  final String? symbol;
  num? rate;

  Currency({
    this.flag = SvgsFlags.none,
    required this.code,
    required this.country,
    required this.title,
    this.symbol,
    this.rate,
  });

  num currencyRatio(num? currency) {
    // можно было бы в самом начале проверять if (rate == 0 || currency == 0) => return 0;
    //TODO remove division by zero
    num a = (rate ?? 0) / (currency ?? 0);
    if (a.isNaN) {
      return 0;
    } else if (a == a.toInt()) {
      // зачем возвращать либо инт, либо дабл? почему не всегда дабл?
      return a.toInt();
    }
    return a;
  }
}
