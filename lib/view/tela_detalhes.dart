// ignore_for_file: prefer_const_constructors

import 'package:app04_ibge/model/pais.dart';
import 'package:flutter/material.dart';

class TelaDetalhes extends StatefulWidget {
  const TelaDetalhes({Key? key}) : super(key: key);

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  @override
  Widget build(BuildContext context) {

    //
    // RECUPERAR OS DADOS PASSADOS COMO PARAMETROS
    //

    var p = ModalRoute.of(context)!.settings.arguments as Pais;

    return Scaffold(

      appBar: AppBar(
        title: Text('IBGE'),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black12,
      body: Padding(
        padding: EdgeInsets.all(10),
          //
          // EXIBIR DETALHES DO PAIS
          //

          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //BANDEIRA
                Image.network(
                  'https://countryflagsapi.com/png/${p.abreviatura.toLowerCase()}',
                ),
                Text(
                  p.nome,
                  style: TextStyle(
                    fontSize: 32,
                  ),
                  
                  ),
                  SizedBox(
                    height: 10,
                    ),
                  Text(p.historico),
              ],
            ),
          ),
      ),
      //
      // FLOATING ACTION BUTTON
      //
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        backgroundColor: Colors.black54,
        onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 4),
              content: Text('${p.nome} adicionado aos favoritos.'),
            ),
          );
          Navigator.pop(context);
        },
      ),
    );
  }
}
