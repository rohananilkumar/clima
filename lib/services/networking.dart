import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future<dynamic> getData() async {
    http.Response r = await http.get(url);
    if (r.statusCode == 200) {
      return Future.value(jsonDecode(r.body));
    } else {
      return false;
    }
  }
}
