// Importa las bibliotecas necesarias de Flutter y url_launcher.
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Biblioteca para manejar URLs, como llamadas telefónicas y mensajes de texto.

// Definición de la clase 'AboutUsScreen' que es un widget sin estado (StatelessWidget).
class AboutUsScreen extends StatelessWidget {
  // Método para enviar un mensaje de texto a un número específico.
  void _sendMessage(String number) async {
    // Crea una URI (Identificador Uniforme de Recursos) usando el esquema 'sms' y el número de teléfono.
    final Uri smsUri = Uri(
      scheme: 'sms', // Esquema que define la acción de enviar un mensaje de texto.
      path: number, // Número de teléfono al que se enviará el mensaje.
    );
    // Verifica si es posible lanzar (abrir) la aplicación de mensajería.
    if (await canLaunchUrl(smsUri)) {
      // Si es posible, abre la aplicación de mensajería con el número de teléfono proporcionado.
      await launchUrl(smsUri);
    } else {
      // Si no es posible, arroja un error.
      throw 'No se pudo enviar el mensaje a $number';
    }
  }

  // Método para realizar una llamada telefónica a un número específico.
  void _makeCall(String number) async {
    // Crea una URI usando el esquema 'tel' y el número de teléfono.
    final Uri telUri = Uri(
      scheme: 'tel', // Esquema que define la acción de hacer una llamada telefónica.
      path: number, // Número de teléfono al que se llamará.
    );
    // Verifica si es posible lanzar (abrir) la aplicación de llamadas.
    if (await canLaunchUrl(telUri)) {
      // Si es posible, abre la aplicación de llamadas con el número de teléfono proporcionado.
      await launchUrl(telUri);
    } else {
      // Si no es posible, arroja un error.
      throw 'No se pudo realizar la llamada a $number';
    }
  }

  // Método principal que construye la interfaz de usuario.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold proporciona una estructura visual básica para la interfaz, como una barra de aplicaciones y un cuerpo principal.
      appBar: AppBar(
        title: const Text('About Us'), // Título de la barra de aplicaciones.
      ),
      body: ListView(
        // ListView permite mostrar una lista de elementos desplazables.
        padding: const EdgeInsets.all(16.0), // Agrega un espacio alrededor de la lista.
        children: [
          // Llama al método _buildContactItem para crear cada contacto en la lista.
          _buildContactItem(
            context,
            'Carlos Eduardo Gumeta Navarro', // Nombre del contacto.
            '221199', // ID del contacto.
            '9711315960', // Número de teléfono del contacto.
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

  // Método que construye cada elemento de contacto de la lista.
  Widget _buildContactItem(BuildContext context, String name, String id, String phone) {
    return Card(
      // Card proporciona un contenedor visual con borde y sombra.
      child: ListTile(
        // ListTile representa un único elemento de lista que consta de un título, subtítulo y elementos de control (iconos).
        title: Text(name), // Nombre del contacto.
        subtitle: Text('ID: $id'), // ID del contacto.
        trailing: Row(
          // Contenedor horizontal que contiene los botones de acción (mensaje y llamada).
          mainAxisSize: MainAxisSize.min, // Ajusta el tamaño del contenedor al tamaño mínimo necesario.
          children: [
            IconButton(
              icon: const Icon(Icons.message), // Icono de mensaje.
              onPressed: () => _sendMessage(phone), // Acción que se ejecuta al presionar el botón de mensaje.
              tooltip: 'Enviar mensaje', // Texto de ayuda que se muestra al mantener el cursor sobre el botón.
            ),
            IconButton(
              icon: const Icon(Icons.call), // Icono de llamada.
              onPressed: () => _makeCall(phone), // Acción que se ejecuta al presionar el botón de llamada.
              tooltip: 'Llamar', // Texto de ayuda que se muestra al mantener el cursor sobre el botón.
            ),
          ],
        ),
      ),
    );
  }
}
