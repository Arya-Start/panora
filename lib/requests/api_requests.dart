import 'package:http/http.dart' as http;

class ApiRequest {
  final String baseUrl = 'http://159.65.3.185:8080/panora';

  String queryUrl = '/api/search?q=';

  Future<http.Response> mSearch(String query) async {
    return await http.get('$baseUrl' '$queryUrl' '$query');
  }

  Future<http.Response> getAuthors() async {
    return await http.get('$baseUrl' '/api/authors');
  }
}
