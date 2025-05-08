import 'dart:math';

import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  TextEditingController usuario = TextEditingController();
  TextEditingController senha = TextEditingController();
  String _textoInfo = "Informe seus dados";

  void _limpar_Tela(){
    usuario.text =   "";
    senha.text = "";

    setState((){
      _textoInfo = "Informe seus dados";
    });
  }
  void _calcular_Imc(){
    setState(() {
      String nomeUsuario = usuario.text;
      String senhaUsuario = senha.text;
      if (nomeUsuario.isEmpty || senhaUsuario.isEmpty) {
        _textoInfo = "Preencha os dados corretamente.";
      }
      else {
        _textoInfo = "Dados cadastrados!";  
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Usuário"),
        centerTitle: true,
        backgroundColor: Colors.purple,
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
                  labelText: "Usuário",
                  labelStyle: TextStyle(color : Colors.purple)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: usuario,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color : Colors.purple)),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: senha,
            ),
            SizedBox(
              height: 50.0,
              child: ElevatedButton(
                onPressed: _calcular_Imc,
                child: Text("Cadastrar"),
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
