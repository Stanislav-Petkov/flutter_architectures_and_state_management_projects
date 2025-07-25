import 'package:auto_route/auto_route.dart';
import 'package:bloc_examples/core/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: InitialRoute.page, initial: true),
    AutoRoute(page: CounterRoute.page),
  ];
}
