import 'package:flutter/material.dart';

class InicioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestor de Jerseys', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueGrey[900]!, Colors.blueGrey[50]!],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sports_soccer_rounded, // Usaremos un icono de deportes
              size: 120,
              color: Colors.white70,
            ),
            SizedBox(height: 50),
            _buildBotonElegante(
              context,
              titulo: 'Capturar Jerseys',
              icono: Icons.add_circle_outline,
              ruta: '/capturajerseys',
              color: Colors.teal,
            ),
            SizedBox(height: 20),
            _buildBotonElegante(
              context,
              titulo: 'Ver Jerseys',
              icono: Icons.list_alt_rounded,
              ruta: '/verjerseys',
              color: Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBotonElegante(BuildContext context, {
    required String titulo,
    required IconData icono,
    required String ruta,
    required Color color
  }) {
    return ElevatedButton.icon(
      icon: Icon(icono, size: 28),
      label: Text(
        titulo,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        minimumSize: Size(250, 60),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, ruta);
      },
    );
  }
}
