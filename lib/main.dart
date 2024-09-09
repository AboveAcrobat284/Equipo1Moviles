// Importa las bibliotecas necesarias de Flutter.
import 'package:flutter/material.dart';
// Importa la pantalla 'aboutus_screen.dart' que creamos para mostrar la información de "About Us".
import 'screens/aboutus_screen.dart'; 

// Punto de entrada de la aplicación Flutter.
void main() {
  // Ejecuta la aplicación llamando a la clase MyApp.
  runApp(const MyApp());
}

// Clase principal de la aplicación, extiende StatelessWidget, lo que significa que esta parte de la interfaz es inmutable.
class MyApp extends StatelessWidget {
  // Constructor constante para MyApp.
  const MyApp({super.key});

  // El método build se llama cuando Flutter necesita construir la interfaz de usuario.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título de la aplicación.
      title: 'Flutter Demo',
      // Tema de la aplicación (colores, estilos).
      theme: ThemeData(
        // Establece un esquema de color basado en el color de semilla dado (deepPurple en este caso).
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // Habilita el uso de Material Design 3.
        useMaterial3: true,
      ),
      // Establece la pantalla inicial o página principal de la aplicación.
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// Define una clase que representa la página de inicio de la aplicación.
class MyHomePage extends StatefulWidget {
  // Constructor constante para MyHomePage.
  const MyHomePage({super.key, required this.title});

  // Título que se mostrará en la página.
  final String title;

  // Crea el estado de la página de inicio (esto permite manejar cambios de estado en la interfaz de usuario).
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Clase que representa el estado de la página de inicio. Esto permite que la interfaz de usuario cambie dinámicamente.
class _MyHomePageState extends State<MyHomePage> {
  // El método build se llama cada vez que se necesita construir o actualizar la interfaz de usuario.
  @override
  Widget build(BuildContext context) {
    // Scaffold es un contenedor que proporciona una estructura visual básica para la interfaz, como una barra de aplicaciones (app bar) y un cuerpo principal.
    return Scaffold(
      // Barra de aplicaciones en la parte superior de la pantalla.
      appBar: AppBar(
        // Establece el color de fondo de la barra de aplicaciones usando el esquema de colores de la aplicación.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Muestra el título de la página en la barra de aplicaciones.
        title: Text(widget.title),
      ),
      // Cuerpo principal de la pantalla, que contiene un botón en el centro.
      body: Center(
        // ElevatedButton es un botón elevado (con un fondo) que se puede presionar.
        child: ElevatedButton(
          // Define la acción a realizar cuando se presiona el botón.
          onPressed: () {
            // Usa Navigator para empujar una nueva ruta (pantalla) a la pila de navegación, llevando al usuario a la pantalla AboutUsScreen.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutUsScreen()),
            );
          },
          // Texto que se muestra en el botón.
          child: const Text('Go to About Us'),
        ),
      ),
    );
  }
}
