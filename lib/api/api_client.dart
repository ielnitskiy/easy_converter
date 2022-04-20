import 'dart:convert';
import 'dart:io';

void main() async {
  Map<String, dynamic> json = await ApiClient().get();
print(json);
}

class ApiClient {
  final client = HttpClient();

  Future<Map<String, dynamic>> get() async {
    final url = Uri.parse('https://cdn.cur.su/api/latest.json');
    final request = await client.getUrl(url);
    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v));
    return json;
  }
}
