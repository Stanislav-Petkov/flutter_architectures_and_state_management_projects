import 'package:dart_mappable/dart_mappable.dart';

part 'movies_model.mapper.dart';

@MappableClass()
class MoviesModel with MoviesModelMappable {
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;

  MoviesModel({this.page, this.results, this.totalPages, this.totalResults});
}

@MappableClass()
class MovieModel with MovieModelMappable {
  MovieModel({this.title});
  String? title;
}
