import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_list/core/constants/constants.dart';

@module
abstract class DioModule {
  Dio dio() {
    return Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: {'Authorization': 'Bearer ${Constants.bearer}'},
      ),
    );
  }
}
