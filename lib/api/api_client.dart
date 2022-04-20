import 'package:cur_val/domain/rates.dart';
import 'dart:convert';
import 'dart:io';

void main() {
ApiClient().getRates();
}

class ApiClient {
  final client = HttpClient();

  Future<RatesList> getRates() async {
    final url = Uri.parse('https://cdn.cur.su/api/latest.json');
    final request = await client.getUrl(url);
    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v));
    return RatesList.fromJson(json);

  }
}
