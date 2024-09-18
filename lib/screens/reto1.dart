import 'package:flutter/material.dart';

class Reto1Screen extends StatefulWidget {
  const Reto1Screen({Key? key}) : super(key: key);

  @override
  _Reto1ScreenState createState() => _Reto1ScreenState();
}

class _Reto1ScreenState extends State<Reto1Screen> {
  final TextEditingController _textController = TextEditingController();
  String _inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reto 1'), // Título de la pantalla
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Margen alrededor del contenido
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextField personalizado
            CustomTextField(
              controller: _textController,
              onChanged: (value) {
                setState(() {
                  _inputText = value; // Actualizamos el estado con el valor del TextField
                });
              },
            ),
            const SizedBox(height: 40),
            // Botón personalizado
            CustomButton(
              text: 'Mostrar Texto',
              onPressed: () {
                // Mostrar el texto ingresado en un SnackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Texto ingresado: $_inputText')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Botón personalizado con estilo
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
      ),
      child: Text(text),
    );
  }
}

// TextField personalizado
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const CustomTextField({Key? key, required this.controller, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: const InputDecoration(
        border: OutlineInputBorder(), // Borde del campo de texto
        labelText: 'Ingresa el texto', // Etiqueta del campo
      ),
      style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Color del texto ingresado
    );
  }
}
