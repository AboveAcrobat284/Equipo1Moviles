import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/contact.dart';
import 'screens/reto1.dart';
import 'screens/reto2.dart';
import 'screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UP Chiapas',
      theme: ThemeData(
        brightness: Brightness.dark, // Establecemos el tema oscuro
        primaryColor: Colors.deepOrangeAccent,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
          brightness: Brightness.dark, // El color scheme también debe coincidir con el brillo oscuro
        ).copyWith(
          secondary: Colors.orangeAccent, // Color secundario para botones o elementos destacados
        ),
        scaffoldBackgroundColor: const Color(0xFF2D2D2D), // Fondo oscuro de la app
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1F1F1F), // Color del AppBar
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontFamily: 'Roboto', fontSize: 18), // Texto general
          headlineSmall: TextStyle(color: Colors.white, fontFamily: 'RobotoCondensed', fontSize: 24), // Títulos
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepOrangeAccent, // Color de los botones
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Botones redondeados
          ),
        ),
      ),
      initialRoute: '/', // Ruta inicial al cargar la app
      routes: {
        '/': (context) => const SplashScreen(), // Navegación a SplashScreen
        '/home': (context) => const HomeScreen(), // Navegación a HomeScreen
        '/contact': (context) => ContactScreen(), // Navegación a ContactScreen
        '/reto1': (context) => const Reto1Screen(), // Navegación a Reto1Screen
        '/reto2': (context) => const Reto2Screen(), // Navegación a Reto2Screen
      },
      debugShowCheckedModeBanner: false, // Eliminamos el banner de debug
    );
  }
}
