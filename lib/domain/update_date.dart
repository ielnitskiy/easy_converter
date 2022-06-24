
import 'package:easy_converter/api/api_client.dart';

class UpdateDate {
  static String updateDate = '';

  getLastUpdate() async {
    Map<String, dynamic> rates = await ApiClient().get();
    return rates['lastupdate'];
  }
}
