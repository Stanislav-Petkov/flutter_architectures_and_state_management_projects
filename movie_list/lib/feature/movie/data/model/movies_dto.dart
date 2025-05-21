import 'package:dart_mappable/dart_mappable.dart';
import 'package:movie_list/feature/movie/domain/model/movies_model.dart';

part 'movies_dto.mapper.dart';

@MappableClass()
class MoviesDto with MoviesDtoMappable {
  int? page;
  List<MovieDto>? results;
  int? totalPages;
  int? totalResults;

  MoviesDto({this.page, this.results, this.totalPages, this.totalResults});

  MoviesModel toModel() => MoviesModel(
    page: page,
    results: results?.map((movieDto) => movieDto.toModel()).toList(),
    totalPages: totalPages,
    totalResults: totalResults,
  );

  static const fromJson = MoviesDtoMapper.fromMap;
}

@MappableClass()
class MovieDto with MovieDtoMappable {
  String? title;

  MovieDto({this.title});

  MovieModel toModel() => MovieModel(title: title);

  static const fromJson = MovieDtoMapper.fromMap;
}
