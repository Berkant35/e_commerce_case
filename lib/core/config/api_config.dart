class ApiConfig {
  static const String baseUrl = "https://testcase.myideasoft.com/admin-api";
  static const String token = "AX5FTZ7UBAABUDT6XYYPW7LX";
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);
  static const Duration crudTimeout= Duration(seconds: 15);


  static const Map<String, dynamic> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
}