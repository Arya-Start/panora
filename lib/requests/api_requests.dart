import 'package:http/http.dart' as http;

class ApiRequest {
  final String baseUrl = 'http://159.65.3.185:8080/panora';

  Future<http.Response> mSearch(String query) {
    return http.get('$baseUrl' + '/api/search?q=$query');
  }
}
