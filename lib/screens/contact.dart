import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // API para llamadas y mensajes

class ContactScreen extends StatelessWidget {
  // Función para enviar un mensaje de texto
  void _sendMessage(String number) async {
    final Uri smsUri = Uri(
      scheme: 'sms', // Definimos el esquema para SMS
      path: number, // Número de teléfono al que se enviará el mensaje
    );
    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri); // Enviar mensaje
    } else {
      throw 'No se pudo enviar el mensaje a $number'; // Manejo de error
    }
  }

  // Función para hacer una llamada telefónica
  void _makeCall(String number) async {
    final Uri telUri = Uri(
      scheme: 'tel', // Definimos el esquema para llamadas telefónicas
      path: number, // Número de teléfono al que se llamará
    );
    if (await canLaunchUrl(telUri)) {
      await launchUrl(telUri); // Realizar la llamada
    } else {
      throw 'No se pudo realizar la llamada a $number'; // Manejo de error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactos'), // Título del AppBar
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0), // Margen alrededor de la lista
        children: [
          // Llamamos a la función que construye cada elemento de contacto
          _buildContactItem(
            context,
            'Carlos Eduardo Gumeta Navarro',
            '221199',
            '9711315960',
          ),
          _buildContactItem(
            context,
            'Jesus Alejandro Guillen Luna',
            '221198',
            '9651052289',
          ),
          _buildContactItem(
            context,
            'Joel de Jesús López Ruíz',
            '221204',
            '9661130883',
          ),
        ],
      ),
    );
  }

  // Widget que construye cada contacto de la lista
  Widget _buildContactItem(BuildContext context, String name, String id, String phone) {
    return Card(
      child: ListTile(
        title: Text(name), // Nombre del contacto
        subtitle: Text('ID: $id'), // ID del contacto
        trailing: Row(
          mainAxisSize: MainAxisSize.min, // Ajustamos el tamaño de la fila
          children: [
            // Botón para enviar mensaje
            IconButton(
              icon: const Icon(Icons.message),
              onPressed: () => _sendMessage(phone), // Llamamos a la función para enviar mensaje
              tooltip: 'Enviar mensaje', // Tooltip
            ),
            // Botón para hacer una llamada
            IconButton(
              icon: const Icon(Icons.call),
              onPressed: () => _makeCall(phone), // Llamamos a la función para hacer la llamada
              tooltip: 'Llamar', // Tooltip
            ),
          ],
        ),
      ),
    );
  }
}
