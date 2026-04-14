import 'clasejerseys.dart';
import 'diccionariojerseys.dart';

class GuardarDatosDiccionario {
  static int _siguienteId = 1;

  static void guardarProducto({
    required String nombre,
    required String color,
    required String talla,
  }) {
    if (datosjerseys.isNotEmpty) {
      _siguienteId = datosjerseys.keys.reduce((a, b) => a > b ? a : b) + 1;
    }

    final nuevoProducto = Producto(
      id: _siguienteId,
      nombre: nombre,
      color: color,
      talla: talla,
    );

    datosjerseys[_siguienteId] = nuevoProducto;
    _siguienteId++;
  }
}
