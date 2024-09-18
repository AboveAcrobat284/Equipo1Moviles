import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math'; // Para generar números aleatorios

class Reto2Screen extends StatefulWidget {
  const Reto2Screen({Key? key}) : super(key: key);

  @override
  _Reto2ScreenState createState() => _Reto2ScreenState();
}

class _Reto2ScreenState extends State<Reto2Screen> {
  late Future<String> _imageUrl;

  @override
  void initState() {
    super.initState();
    _imageUrl = fetchRickAndMortyImage(); // Cargar imagen aleatoria
  }

  // Función para obtener una imagen aleatoria de Rick and Morty
  Future<String> fetchRickAndMortyImage() async {
    final random = Random();
    final randomId = random.nextInt(826) + 1; // Generamos un ID aleatorio entre 1 y 826
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character/$randomId'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['image'] as String; // Retornamos la URL de la imagen
    } else {
      throw Exception('Error al cargar la imagen de Rick and Morty');
    }
  }

  // Función para recargar la imagen
  void reloadImage() {
    setState(() {
      _imageUrl = fetchRickAndMortyImage(); // Actualizamos el estado para recargar la imagen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Rick and Morty Image'), // Título del AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<String>(
              future: _imageUrl, // Imagen obtenida desde la API
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Indicador de carga
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}'); // Mostrar error si lo hay
                } else {
                  return Image.network(snapshot.data ?? ''); // Mostrar la imagen
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: reloadImage, // Botón para recargar la imagen
              child: const Text('Cargar otra imagen'),
            )
          ],
        ),
      ),
    );
  }
}
