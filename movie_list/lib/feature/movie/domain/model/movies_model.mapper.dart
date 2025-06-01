// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'movies_model.dart';

class MoviesModelMapper extends ClassMapperBase<MoviesModel> {
  MoviesModelMapper._();

  static MoviesModelMapper? _instance;
  static MoviesModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MoviesModelMapper._());
      MovieModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MoviesModel';

  static int? _$page(MoviesModel v) => v.page;
  static const Field<MoviesModel, int> _f$page =
      Field('page', _$page, opt: true);
  static List<MovieModel>? _$results(MoviesModel v) => v.results;
  static const Field<MoviesModel, List<MovieModel>> _f$results =
      Field('results', _$results, opt: true);
  static int? _$totalPages(MoviesModel v) => v.totalPages;
  static const Field<MoviesModel, int> _f$totalPages =
      Field('totalPages', _$totalPages, opt: true);
  static int? _$totalResults(MoviesModel v) => v.totalResults;
  static const Field<MoviesModel, int> _f$totalResults =
      Field('totalResults', _$totalResults, opt: true);

  @override
  final MappableFields<MoviesModel> fields = const {
    #page: _f$page,
    #results: _f$results,
    #totalPages: _f$totalPages,
    #totalResults: _f$totalResults,
  };

  static MoviesModel _instantiate(DecodingData data) {
    return MoviesModel(
        page: data.dec(_f$page),
        results: data.dec(_f$results),
        totalPages: data.dec(_f$totalPages),
        totalResults: data.dec(_f$totalResults));
  }

  @override
  final Function instantiate = _instantiate;

  static MoviesModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MoviesModel>(map);
  }

  static MoviesModel fromJson(String json) {
    return ensureInitialized().decodeJson<MoviesModel>(json);
  }
}

mixin MoviesModelMappable {
  String toJson() {
    return MoviesModelMapper.ensureInitialized()
        .encodeJson<MoviesModel>(this as MoviesModel);
  }

  Map<String, dynamic> toMap() {
    return MoviesModelMapper.ensureInitialized()
        .encodeMap<MoviesModel>(this as MoviesModel);
  }

  MoviesModelCopyWith<MoviesModel, MoviesModel, MoviesModel> get copyWith =>
      _MoviesModelCopyWithImpl<MoviesModel, MoviesModel>(
          this as MoviesModel, $identity, $identity);
  @override
  String toString() {
    return MoviesModelMapper.ensureInitialized()
        .stringifyValue(this as MoviesModel);
  }

  @override
  bool operator ==(Object other) {
    return MoviesModelMapper.ensureInitialized()
        .equalsValue(this as MoviesModel, other);
  }

  @override
  int get hashCode {
    return MoviesModelMapper.ensureInitialized().hashValue(this as MoviesModel);
  }
}

extension MoviesModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MoviesModel, $Out> {
  MoviesModelCopyWith<$R, MoviesModel, $Out> get $asMoviesModel =>
      $base.as((v, t, t2) => _MoviesModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MoviesModelCopyWith<$R, $In extends MoviesModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, MovieModel, MovieModelCopyWith<$R, MovieModel, MovieModel>>?
      get results;
  $R call(
      {int? page,
      List<MovieModel>? results,
      int? totalPages,
      int? totalResults});
  MoviesModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MoviesModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MoviesModel, $Out>
    implements MoviesModelCopyWith<$R, MoviesModel, $Out> {
  _MoviesModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MoviesModel> $mapper =
      MoviesModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, MovieModel, MovieModelCopyWith<$R, MovieModel, MovieModel>>?
      get results => $value.results != null
          ? ListCopyWith($value.results!, (v, t) => v.copyWith.$chain(t),
              (v) => call(results: v))
          : null;
  @override
  $R call(
          {Object? page = $none,
          Object? results = $none,
          Object? totalPages = $none,
          Object? totalResults = $none}) =>
      $apply(FieldCopyWithData({
        if (page != $none) #page: page,
        if (results != $none) #results: results,
        if (totalPages != $none) #totalPages: totalPages,
        if (totalResults != $none) #totalResults: totalResults
      }));
  @override
  MoviesModel $make(CopyWithData data) => MoviesModel(
      page: data.get(#page, or: $value.page),
      results: data.get(#results, or: $value.results),
      totalPages: data.get(#totalPages, or: $value.totalPages),
      totalResults: data.get(#totalResults, or: $value.totalResults));

  @override
  MoviesModelCopyWith<$R2, MoviesModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MoviesModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class MovieModelMapper extends ClassMapperBase<MovieModel> {
  MovieModelMapper._();

  static MovieModelMapper? _instance;
  static MovieModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MovieModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MovieModel';

  static String? _$title(MovieModel v) => v.title;
  static const Field<MovieModel, String> _f$title =
      Field('title', _$title, opt: true);

  @override
  final MappableFields<MovieModel> fields = const {
    #title: _f$title,
  };

  static MovieModel _instantiate(DecodingData data) {
    return MovieModel(title: data.dec(_f$title));
  }

  @override
  final Function instantiate = _instantiate;

  static MovieModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MovieModel>(map);
  }

  static MovieModel fromJson(String json) {
    return ensureInitialized().decodeJson<MovieModel>(json);
  }
}

mixin MovieModelMappable {
  String toJson() {
    return MovieModelMapper.ensureInitialized()
        .encodeJson<MovieModel>(this as MovieModel);
  }

  Map<String, dynamic> toMap() {
    return MovieModelMapper.ensureInitialized()
        .encodeMap<MovieModel>(this as MovieModel);
  }

  MovieModelCopyWith<MovieModel, MovieModel, MovieModel> get copyWith =>
      _MovieModelCopyWithImpl<MovieModel, MovieModel>(
          this as MovieModel, $identity, $identity);
  @override
  String toString() {
    return MovieModelMapper.ensureInitialized()
        .stringifyValue(this as MovieModel);
  }

  @override
  bool operator ==(Object other) {
    return MovieModelMapper.ensureInitialized()
        .equalsValue(this as MovieModel, other);
  }

  @override
  int get hashCode {
    return MovieModelMapper.ensureInitialized().hashValue(this as MovieModel);
  }
}

extension MovieModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MovieModel, $Out> {
  MovieModelCopyWith<$R, MovieModel, $Out> get $asMovieModel =>
      $base.as((v, t, t2) => _MovieModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MovieModelCopyWith<$R, $In extends MovieModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? title});
  MovieModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MovieModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MovieModel, $Out>
    implements MovieModelCopyWith<$R, MovieModel, $Out> {
  _MovieModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MovieModel> $mapper =
      MovieModelMapper.ensureInitialized();
  @override
  $R call({Object? title = $none}) =>
      $apply(FieldCopyWithData({if (title != $none) #title: title}));
  @override
  MovieModel $make(CopyWithData data) =>
      MovieModel(title: data.get(#title, or: $value.title));

  @override
  MovieModelCopyWith<$R2, MovieModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MovieModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
