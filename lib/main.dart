import 'package:flutter/material.dart';
import 'inicio.dart';
import 'capturajerseys.dart';
import 'verjerseys.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jerseys App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey)
            .copyWith(secondary: Colors.teal),
        useMaterial3: false,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InicioScreen(),
        '/capturajerseys': (context) => CapturaJerseysScreen(),
        '/verjerseys': (context) => VerJerseysScreen(),
      },
    );
  }
}
