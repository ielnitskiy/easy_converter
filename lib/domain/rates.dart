import 'dart:convert';

class RatesList {
  List<Rate>? ratesList;

  RatesList({ this.ratesList});

  factory RatesList.fromJson(Map<String, dynamic> json) {
    // var ratesJson = json["rates"] as Map<String, dynamic>;
    var rates = jsonDecode(json['rates']);

    print(rates.runtimeType);
    print(rates);
    return rates;
  }
}

class Rate {
  final String code;
  final num rate;

  Rate({required this.code, required this.rate});

  factory Rate.fromJson(String code, dynamic rate) {
    return Rate(
      code: code,
      rate: rate,
    );
  }
}
