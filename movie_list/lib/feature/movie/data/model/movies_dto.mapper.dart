// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'movies_dto.dart';

class MoviesDtoMapper extends ClassMapperBase<MoviesDto> {
  MoviesDtoMapper._();

  static MoviesDtoMapper? _instance;
  static MoviesDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MoviesDtoMapper._());
      MovieDtoMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MoviesDto';

  static int? _$page(MoviesDto v) => v.page;
  static const Field<MoviesDto, int> _f$page = Field('page', _$page, opt: true);
  static List<MovieDto>? _$results(MoviesDto v) => v.results;
  static const Field<MoviesDto, List<MovieDto>> _f$results =
      Field('results', _$results, opt: true);
  static int? _$totalPages(MoviesDto v) => v.totalPages;
  static const Field<MoviesDto, int> _f$totalPages =
      Field('totalPages', _$totalPages, opt: true);
  static int? _$totalResults(MoviesDto v) => v.totalResults;
  static const Field<MoviesDto, int> _f$totalResults =
      Field('totalResults', _$totalResults, opt: true);

  @override
  final MappableFields<MoviesDto> fields = const {
    #page: _f$page,
    #results: _f$results,
    #totalPages: _f$totalPages,
    #totalResults: _f$totalResults,
  };

  static MoviesDto _instantiate(DecodingData data) {
    return MoviesDto(
        page: data.dec(_f$page),
        results: data.dec(_f$results),
        totalPages: data.dec(_f$totalPages),
        totalResults: data.dec(_f$totalResults));
  }

  @override
  final Function instantiate = _instantiate;

  static MoviesDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MoviesDto>(map);
  }

  static MoviesDto fromJson(String json) {
    return ensureInitialized().decodeJson<MoviesDto>(json);
  }
}

mixin MoviesDtoMappable {
  String toJson() {
    return MoviesDtoMapper.ensureInitialized()
        .encodeJson<MoviesDto>(this as MoviesDto);
  }

  Map<String, dynamic> toMap() {
    return MoviesDtoMapper.ensureInitialized()
        .encodeMap<MoviesDto>(this as MoviesDto);
  }

  MoviesDtoCopyWith<MoviesDto, MoviesDto, MoviesDto> get copyWith =>
      _MoviesDtoCopyWithImpl<MoviesDto, MoviesDto>(
          this as MoviesDto, $identity, $identity);
  @override
  String toString() {
    return MoviesDtoMapper.ensureInitialized()
        .stringifyValue(this as MoviesDto);
  }

  @override
  bool operator ==(Object other) {
    return MoviesDtoMapper.ensureInitialized()
        .equalsValue(this as MoviesDto, other);
  }

  @override
  int get hashCode {
    return MoviesDtoMapper.ensureInitialized().hashValue(this as MoviesDto);
  }
}

extension MoviesDtoValueCopy<$R, $Out> on ObjectCopyWith<$R, MoviesDto, $Out> {
  MoviesDtoCopyWith<$R, MoviesDto, $Out> get $asMoviesDto =>
      $base.as((v, t, t2) => _MoviesDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MoviesDtoCopyWith<$R, $In extends MoviesDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, MovieDto, MovieDtoCopyWith<$R, MovieDto, MovieDto>>?
      get results;
  $R call(
      {int? page, List<MovieDto>? results, int? totalPages, int? totalResults});
  MoviesDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MoviesDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MoviesDto, $Out>
    implements MoviesDtoCopyWith<$R, MoviesDto, $Out> {
  _MoviesDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MoviesDto> $mapper =
      MoviesDtoMapper.ensureInitialized();
  @override
  ListCopyWith<$R, MovieDto, MovieDtoCopyWith<$R, MovieDto, MovieDto>>?
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
  MoviesDto $make(CopyWithData data) => MoviesDto(
      page: data.get(#page, or: $value.page),
      results: data.get(#results, or: $value.results),
      totalPages: data.get(#totalPages, or: $value.totalPages),
      totalResults: data.get(#totalResults, or: $value.totalResults));

  @override
  MoviesDtoCopyWith<$R2, MoviesDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MoviesDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class MovieDtoMapper extends ClassMapperBase<MovieDto> {
  MovieDtoMapper._();

  static MovieDtoMapper? _instance;
  static MovieDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MovieDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MovieDto';

  static String? _$title(MovieDto v) => v.title;
  static const Field<MovieDto, String> _f$title =
      Field('title', _$title, opt: true);

  @override
  final MappableFields<MovieDto> fields = const {
    #title: _f$title,
  };

  static MovieDto _instantiate(DecodingData data) {
    return MovieDto(title: data.dec(_f$title));
  }

  @override
  final Function instantiate = _instantiate;

  static MovieDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MovieDto>(map);
  }

  static MovieDto fromJson(String json) {
    return ensureInitialized().decodeJson<MovieDto>(json);
  }
}

mixin MovieDtoMappable {
  String toJson() {
    return MovieDtoMapper.ensureInitialized()
        .encodeJson<MovieDto>(this as MovieDto);
  }

  Map<String, dynamic> toMap() {
    return MovieDtoMapper.ensureInitialized()
        .encodeMap<MovieDto>(this as MovieDto);
  }

  MovieDtoCopyWith<MovieDto, MovieDto, MovieDto> get copyWith =>
      _MovieDtoCopyWithImpl<MovieDto, MovieDto>(
          this as MovieDto, $identity, $identity);
  @override
  String toString() {
    return MovieDtoMapper.ensureInitialized().stringifyValue(this as MovieDto);
  }

  @override
  bool operator ==(Object other) {
    return MovieDtoMapper.ensureInitialized()
        .equalsValue(this as MovieDto, other);
  }

  @override
  int get hashCode {
    return MovieDtoMapper.ensureInitialized().hashValue(this as MovieDto);
  }
}

extension MovieDtoValueCopy<$R, $Out> on ObjectCopyWith<$R, MovieDto, $Out> {
  MovieDtoCopyWith<$R, MovieDto, $Out> get $asMovieDto =>
      $base.as((v, t, t2) => _MovieDtoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MovieDtoCopyWith<$R, $In extends MovieDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? title});
  MovieDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MovieDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MovieDto, $Out>
    implements MovieDtoCopyWith<$R, MovieDto, $Out> {
  _MovieDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MovieDto> $mapper =
      MovieDtoMapper.ensureInitialized();
  @override
  $R call({Object? title = $none}) =>
      $apply(FieldCopyWithData({if (title != $none) #title: title}));
  @override
  MovieDto $make(CopyWithData data) =>
      MovieDto(title: data.get(#title, or: $value.title));

  @override
  MovieDtoCopyWith<$R2, MovieDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MovieDtoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
