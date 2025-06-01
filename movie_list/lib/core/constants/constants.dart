import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Constants {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static final bearer = dotenv.env['BEARER_TOKEN'];
}
