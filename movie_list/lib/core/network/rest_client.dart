import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_list/feature/movie/data/repository/movie_client.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
}

@module
abstract class RestModule {
  @lazySingleton
  RestClient client(Dio dio) {
    return RestClient(dio);
  }

  @lazySingleton
  MovieClient movieClient(Dio dio) {
    return MovieClient(dio);
  }
}
