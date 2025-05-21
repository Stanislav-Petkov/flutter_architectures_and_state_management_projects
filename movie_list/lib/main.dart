import 'package:flutter/material.dart';
import 'package:movie_list/core/di/injection_container.dart';
import 'package:movie_list/feature/movie/presentation/ui_components/movie_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  configureDependencies();
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MoviePage());
  }
}
