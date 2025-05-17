import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movie_list/feature/movie/domain/model/movies_model.dart';
import 'package:movie_list/feature/movie/domain/repository/movie_repository.dart';

part 'movie_state.dart';

@injectable
class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this._movieRepository) : super(HomeLoading());

  final MovieRepository _movieRepository;

  Future<void> getMovie() async {
    emit(HomeLoading());
    try {
      final movies = await _movieRepository.getMovies();
      emit(HomeContent(movies: movies));
    } catch (_) {
      emit(HomeError());
    }
  }
}
