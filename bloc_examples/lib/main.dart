import 'package:bloc_examples/core/routes/app_router.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appRouter = AppRouter();
  runApp(BlocExamplesApp(appRouter));
}

class BlocExamplesApp extends StatelessWidget {
  const BlocExamplesApp(this._appRouter, {super.key});

  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      builder: (context, child) => child!,
    );
  }
}
