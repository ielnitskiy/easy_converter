class RatesList {
  List<Rate> ratesList;

  RatesList({required this.ratesList});

  factory RatesList.fromJson(Map<String, dynamic> json) {
    var ratesJson = json["rates"];
    print(ratesJson.runtimeType);
    List<Rate> rateList = ratesJson.map((e) {
      print(e.runtimeType);
      Rate.fromJson(e);}).toList();
    return RatesList(ratesList: rateList);
  }
}

class Rate {
  final String code;
  final num rate;

  Rate({required this.code, required this.rate});

  factory Rate.fromJson(dynamic json) {
    return Rate(
      code: json.keys.first,
      rate: json.values.first,
    );
  }
}
