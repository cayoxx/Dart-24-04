import 'package:flutter/material.dart';
import 'package:projeto_imc/Cadastro.dart';
import 'package:projeto_imc/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cadastro()
    );
  }
}