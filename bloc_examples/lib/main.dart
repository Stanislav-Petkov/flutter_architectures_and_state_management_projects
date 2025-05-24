import 'package:bloc_examples/core/routes/app_router.dart';
import 'package:bloc_examples/feature/counter/presentation/bloc/counter_bloc.dart';
import 'package:bloc_examples/feature/counter/presentation/widgets/counter_page.dart';
import 'package:bloc_examples/feature/initial/presentaion/widgets/initial_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
