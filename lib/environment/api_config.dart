import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiConfig {
  ApiConfig._();

  static final String apiKey = dotenv.env['API_KEY'] ?? '';
  static const String baseUrl =
      'http://kobis.or.kr/kobisopenapi/webservice/rest/';
}
