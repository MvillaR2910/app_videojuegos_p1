import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Videojuegos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      initialRoute: '/', // Ruta inicial
      routes: {
        '/': (context) => const HomeScreen(), // Pantalla principal
        '/detail': (context) {
          final game =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
          return DetailScreen(game: game);
        },
      },
    );
  }
}
