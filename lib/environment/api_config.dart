import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiConfig {
  static final String apiKey = dotenv.env['API_KEY'] ?? '';
  static const String baseUrl =
      'http://kobis.or.kr/kobisopenapi/webservice/rest/';
}
