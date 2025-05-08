  import 'dart:math';

  import 'package:flutter/material.dart';

  class Home extends StatefulWidget {
    const Home({super.key});

    @override
    State<Home> createState() => _HomeState();
  }

  class _HomeState extends State<Home> {

    TextEditingController pesoController = TextEditingController();
    TextEditingController alturaController = TextEditingController();
    String _textoInfo = "Informe seus dados";

    void _limpar_Tela(){
      pesoController.text =   "";
      alturaController.text = "";

      setState((){
        _textoInfo = "Informe seus dados";
      });
    }
    void _calcular_Imc(){
      setState(() {
        double peso = double.parse(pesoController.text);
        double altura = double.parse(alturaController.text);
        double imc = peso/pow(altura/100  ,2);
        if (imc<16.5) {
          _textoInfo = "Desnutrido (${imc})";
        }
        else if(imc <= 18.5) {
          _textoInfo = "Abaixo do peso (${imc})";
        }
        else if(imc <= 24.9) {
          _textoInfo = "Peso ideal (${imc})";
        }
        else if(imc <= 29.9) {
          _textoInfo = "Sobrepeso (${imc})";
        }
        else if(imc <= 34.9) {
          _textoInfo = "Obesidade Grau I (${imc})";
        }
        else if(imc <= 39.9) {
          _textoInfo = "Obesidade Grau II (${imc})";
        }
        else if(imc <= 39.9) {
          _textoInfo = "Obesidade Grau II (${imc})";
        }
        else {
          _textoInfo = "Obesidade Grau III  (${imc})";
        }
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
       appBar: AppBar(
         title: const Text("Calculadora IMC"),
         centerTitle: true,
         backgroundColor: Colors.red,
         actions: <Widget> [
           IconButton(onPressed: _limpar_Tela,
               icon: Icon(Icons.refresh))
         ],
       ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15,bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.person, size: 120, color: Colors.purple,),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "PESO (KG)",
                  labelStyle: TextStyle(color : Colors.purple)),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0),
                  controller: pesoController,
                ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "ALTURA (CM)",
                    labelStyle: TextStyle(color : Colors.purple)),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
                controller: alturaController,
              ),
            SizedBox(
              height: 50.0,
              child: ElevatedButton(
                onPressed: _calcular_Imc,
                child: Text("Calcular"),
              ),
            ),
              Text(
                _textoInfo,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.purple,fontSize: 25.0),
              )
            ],
          ),
        ),
      );
      return const Placeholder();
    }
  }
