import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TextEditingController para manejar el texto del TextField (campo de búsqueda)
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Uso de AppBar: Barra de navegación superior con iconos y acciones
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparente para que se mezcle con el fondo
        elevation: 0, // Sin sombra
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white), // Icono del menú
          onPressed: () {}, // Acción vacía, pero aquí puedes añadir funcionalidades
        ),
        actions: [
          // Botón para navegar a la pantalla de contactos
          IconButton(
            icon: const Icon(Icons.contact_page, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/contact'); // Redirige a ContactScreen
            },
          ),
          // Botón para navegar a Reto 1
          IconButton(
            icon: const Icon(Icons.assignment, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/reto1'); // Redirige a Reto1Screen
            },
          ),
          // Botón para navegar a Reto 2
          IconButton(
            icon: const Icon(Icons.assignment, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/reto2'); // Redirige a Reto2Screen
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true, // Extiende el cuerpo detrás del AppBar
      body: Stack(
        children: [
          // Fondo con gradiente oscuro
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2D2D2D), Color(0xFF1F1F1F)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Campo de búsqueda (TextField)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // Fondo blanco para contraste
                      borderRadius: BorderRadius.circular(30), // Bordes redondeados
                    ),
                    child: TextField(
                      controller: _searchController, // Controlador del TextField
                      decoration: const InputDecoration(
                        border: InputBorder.none, // Sin borde visible
                        hintText: "¿Qué estás buscando?", // Placeholder
                        icon: Icon(Icons.search, color: Colors.grey), // Icono de búsqueda
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Texto de bienvenida (centrado)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45.0),
                  child: Center(
                    child: Text(
                      'Bienvenido a los retos de programación móvil',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.deepOrangeAccent, // Color de texto destacado
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Botón flotante central
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepOrangeAccent, // Color de fondo del botón
        child: const Icon(Icons.add, color: Colors.white), // Icono blanco
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Ubicación del botón flotante
      // BottomAppBar para la navegación en la parte inferior
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), // Espacio para el botón flotante
        notchMargin: 6.0, // Margen entre el botón y el BottomAppBar
        color: Colors.black, // Fondo negro del BottomAppBar
        elevation: 10, // Sombra elevada
        child: Container(
          height: 60.0, // Altura del BottomAppBar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, // Distribuye los iconos
            children: [
              // Botón de inicio en la barra de navegación
              IconButton(
                icon: const Icon(Icons.home, color: Colors.white), // Icono blanco
                onPressed: () {
                  Navigator.pushNamed(context, '/home'); // Redirige a HomeScreen
                },
              ),
              const SizedBox(width: 30), // Espacio para el botón flotante
              // Botón para la pantalla de contactos
              IconButton(
                icon: const Icon(Icons.contact_page, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, '/contact'); // Redirige a ContactScreen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
