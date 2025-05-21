import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_list/core/di/injection_container.dart';
import 'package:movie_list/feature/movie/domain/model/movies_model.dart';
import 'package:movie_list/feature/movie/presentation/cubit/movie_cubit.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => getIt<MovieCubit>()..getMovie(),
    child: _MovieContent(),
  );
}

class _MovieContent extends StatelessWidget {
  const _MovieContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieCubit, MovieState>(
        builder:
            (context, state) => switch (state) {
              HomeLoading() => CircularProgressIndicator(),
              HomeContent() => MoviesComponent(movies: state.movies),
              HomeError() => Text('Error'),
            },
      ),
    );
  }
}

class MoviesComponent extends StatelessWidget {
  const MoviesComponent({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Card(child: ListTile(title: Text(movie.title ?? 'No Title')));
        },
      ),
    );
  }
}
