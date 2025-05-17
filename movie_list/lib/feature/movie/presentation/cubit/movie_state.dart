part of 'movie_cubit.dart';

@immutable
sealed class MovieState {}

final class HomeLoading extends MovieState {}

final class HomeContent extends MovieState {
  HomeContent({required this.movies});
  final List<MovieModel> movies;
}

final class HomeError extends MovieState {}
