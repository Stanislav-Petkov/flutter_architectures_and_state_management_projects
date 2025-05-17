import 'package:dio/dio.dart';
import 'package:movie_list/feature/movie/data/model/movies_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_client.g.dart';

@RestApi()
abstract class MovieClient {
  factory MovieClient(Dio dio, {String baseUrl}) = _MovieClient;

  @GET('/movie/top_rated')
  Future<MoviesDto> getMovies(@Query('page') int page);
}
