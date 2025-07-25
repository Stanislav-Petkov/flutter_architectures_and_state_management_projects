// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:bloc_examples/feature/counter/presentation/widgets/counter_page.dart'
    as _i1;
import 'package:bloc_examples/feature/initial/presentaion/widgets/initial_page.dart'
    as _i2;

/// generated route for
/// [_i1.CounterPage]
class CounterRoute extends _i3.PageRouteInfo<void> {
  const CounterRoute({List<_i3.PageRouteInfo>? children})
    : super(CounterRoute.name, initialChildren: children);

  static const String name = 'CounterRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.CounterPage();
    },
  );
}

/// generated route for
/// [_i2.InitialPage]
class InitialRoute extends _i3.PageRouteInfo<void> {
  const InitialRoute({List<_i3.PageRouteInfo>? children})
    : super(InitialRoute.name, initialChildren: children);

  static const String name = 'InitialRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.InitialPage();
    },
  );
}
