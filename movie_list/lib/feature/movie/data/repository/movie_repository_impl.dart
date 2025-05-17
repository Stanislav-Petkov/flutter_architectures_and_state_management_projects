import 'package:injectable/injectable.dart';
import 'package:movie_list/feature/movie/data/repository/movie_client.dart';
import 'package:movie_list/feature/movie/domain/model/movies_model.dart';
import 'package:movie_list/feature/movie/domain/repository/movie_repository.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieClient);
  final MovieClient _movieClient;

  @override
  Future<List<MovieModel>> getMovies() async {
    final moviesDto = await _movieClient.getMovies(1);
    final moviesList =
        moviesDto.results?.map((movieDto) => movieDto.toModel()).toList();
    if (moviesList != null && moviesList.isNotEmpty) {
      return moviesList;
    }
    return [];
  }
}
