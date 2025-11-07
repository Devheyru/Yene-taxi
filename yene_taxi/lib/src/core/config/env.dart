import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get mapsKey => dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';
  static bool get hasMapsKey => mapsKey.isNotEmpty;
}
