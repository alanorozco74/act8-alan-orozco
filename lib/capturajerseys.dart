import 'package:flutter/material.dart';
import 'guardardatosdiccionario.dart';

class CapturaJerseysScreen extends StatefulWidget {
  @override
  _CapturaJerseysScreenState createState() => _CapturaJerseysScreenState();
}

class _CapturaJerseysScreenState extends State<CapturaJerseysScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _colorController = TextEditingController();
  final _tallaController = TextEditingController();

  void _guardarDatos() {
    if (_formKey.currentState!.validate()) {
      GuardarDatosDiccionario.guardarProducto(
        nombre: _nombreController.text.trim(),
        color: _colorController.text.trim(),
        talla: _tallaController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 10),
              Text('Jersey guardado exitosamente'),
            ],
          ),
          backgroundColor: Colors.teal,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );

      _nombreController.clear();
      _colorController.clear();
      _tallaController.clear();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capturar Jersey'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[100],
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            children: [
              Card(
                elevation: 10,
                shadowColor: Colors.black26,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Detalles del Producto',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal[800],
                          ),
                        ),
                        SizedBox(height: 30),
                        _buildInputField(
                          controller: _nombreController,
                          label: 'Nombre del Jersey',
                          icon: Icons.stadium_outlined,
                        ),
                        SizedBox(height: 20),
                        _buildInputField(
                          controller: _colorController,
                          label: 'Color',
                          icon: Icons.color_lens_outlined,
                        ),
                        SizedBox(height: 20),
                        _buildInputField(
                          controller: _tallaController,
                          label: 'Talla (Ej. S, M, L)',
                          icon: Icons.straighten_outlined,
                        ),
                        SizedBox(height: 40),
                        ElevatedButton.icon(
                          onPressed: _guardarDatos,
                          icon: Icon(Icons.save_rounded, size: 24),
                          label: Text('Guardar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.teal),
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.teal.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.teal.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.teal, width: 2),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Por favor, ingresa $label';
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _colorController.dispose();
    _tallaController.dispose();
    super.dispose();
  }
}
