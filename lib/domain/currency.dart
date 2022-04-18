class Currency {
  final String icon;
  final String code;
  final String title;
  final String symbol;
  num rate;
  bool isEnable;

  Currency({
    required this.icon,
    required this.code,
    required this.title,
    required this.symbol,
    this.rate = 0,
    required this.isEnable,
  });

  num currencyRatio(num? currency) {
    num a = rate / (currency ?? 0);
    if (a == a.toInt()) {
      return a.toInt();
    }
    return a;
  }
}
