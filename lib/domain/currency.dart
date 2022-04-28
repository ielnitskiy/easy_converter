class Currency {
  String icon;
  final String code;
  final String country;
  final String title;
  final String? symbol;
  num? rate;
  bool isEnable;

  Currency({
    this.icon = '🏴',
    required this.code,
    required this.country,
    required this.title,
    this.symbol,
    this.rate,
    this.isEnable = false,
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
