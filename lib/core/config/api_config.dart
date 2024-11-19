import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static  String baseUrl = dotenv.env['BASE_URL'] ?? '';
  static Map<String, dynamic> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${dotenv.env['API_KEY']}',
  };
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);
  static const Duration crudTimeout= Duration(seconds: 15);
}