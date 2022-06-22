import 'package:easy_converter/api/api_client.dart';

class RateCurrencies {
  Future<Map<String, dynamic>> getRateList() async {
    Map<String, dynamic> rates = await ApiClient().get();
    return rates['rates'];
  }
}
