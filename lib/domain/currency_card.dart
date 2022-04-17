class CurrencyCard {
  final String icon;
  final String code;
  final String title;
  final String symbol;
  num rate;
  num type;

  CurrencyCard({
    required this.icon,
    required this.code,
    required this.title,
    required this.symbol,
    this.rate = 0,
    this.type = 0,
  });

  num currencyRatio(num? currency) {
    num a = rate / (currency ?? 0);
    if (a == a.toInt()) {
      return a.toInt();
    }
    return a;
  }
}
