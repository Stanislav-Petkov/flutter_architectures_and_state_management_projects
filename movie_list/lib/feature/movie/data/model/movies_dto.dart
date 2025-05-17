import 'package:movie_list/feature/movie/domain/model/movies_model.dart';

class MoviesDto {
  int? page;
  List<MovieDto>? results;
  int? totalPages;
  int? totalResults;

  MoviesDto({this.page, this.results, this.totalPages, this.totalResults});

  MoviesDto.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <MovieDto>[];
      json['results'].forEach((v) {
        results!.add(MovieDto.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class MovieDto {
  String? title;

  MovieDto({this.title});

  MovieDto.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['title'] = title;

    return data;
  }

  MovieModel toModel() => MovieModel(title: title);
}
