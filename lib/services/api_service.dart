import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
}

class ApiService {
  static const String _baseUrl = 'https://api.quotable.io/random';

  Future<Map<String, String>> fetchQuote() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {
          'content': data['content'] ?? 'No quote found.',
          'author': data['author'] ?? 'Unknown',
        };
      } else {
        throw ApiException('Failed to load quote: Status code ${response.statusCode}');
      }
    } catch (e) {
      if (e is ApiException) rethrow;
      throw ApiException('Network error occurred: $e');
    }
  }
}
