import 'package:flutter/material.dart';
import 'diccionariojerseys.dart';

class VerJerseysScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jerseys = datosjerseys.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Inventario de Jerseys'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: jerseys.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inventory_2_outlined, size: 100, color: Colors.grey[400]),
                  SizedBox(height: 20),
                  Text(
                    'No hay jerseys registrados.',
                    style: TextStyle(fontSize: 20, color: Colors.grey[600], fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '¡Ve a "Capturar Jerseys" y agrega uno!',
                    style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemCount: jerseys.length,
              itemBuilder: (context, index) {
                final producto = jerseys[index];
                return Card(
                  elevation: 5,
                  shadowColor: Colors.black26,
                  margin: EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    leading: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[50],
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '#${producto.id}',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    title: Text(
                      producto.nombre,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple[800],
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.color_lens, size: 18, color: Colors.grey[600]),
                          SizedBox(width: 5),
                          Text(producto.color, style: TextStyle(fontSize: 16)),
                          SizedBox(width: 20),
                          Icon(Icons.straighten, size: 18, color: Colors.grey[600]),
                          SizedBox(width: 5),
                          Text(producto.talla, style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[400], size: 16),
                  ),
                );
              },
            ),
    );
  }
}
