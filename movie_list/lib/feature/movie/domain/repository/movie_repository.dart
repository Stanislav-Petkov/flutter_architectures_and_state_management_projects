import 'package:movie_list/feature/movie/domain/model/movies_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getMovies();
}
