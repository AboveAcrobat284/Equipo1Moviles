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

  // Función para abrir una URL (enlace a GitHub)
  void _openGitHubRepo() async {
    final Uri githubUri = Uri.parse('https://github.com/AboveAcrobat284/Equipo1Moviles.git');
    if (await canLaunchUrl(githubUri)) {
      await launchUrl(githubUri); // Abre la URL
    } else {
      throw 'No se pudo abrir el repositorio de GitHub'; // Manejo de error
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
            true, // Indicamos que este contacto incluye el botón del enlace a GitHub
          ),
          _buildContactItem(
            context,
            'Jesus Alejandro Guillen Luna',
            '221198',
            '9651052289',
            false, // Sin botón de GitHub
          ),
          _buildContactItem(
            context,
            'Joel de Jesús López Ruíz',
            '221204',
            '9661130883',
            false, // Sin botón de GitHub
          ),
        ],
      ),
    );
  }

  // Widget que construye cada contacto de la lista
  Widget _buildContactItem(BuildContext context, String name, String id, String phone, bool showGithubButton) {
    return Card(
      child: Column(
        children: [
          ListTile(
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
          if (showGithubButton) // Si es cierto, mostramos el botón del enlace a GitHub
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white, // Fondo blanco
                ),
                onPressed: _openGitHubRepo, // Función que abre el enlace
                child: const Text(
                  'Ir al Repositorio de GitHub',
                  style: TextStyle(
                    color: Colors.blue, // Texto en azul
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
