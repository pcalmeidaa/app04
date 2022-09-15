import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/pais.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

  //LISTA DINÂMICA DE OBJETOS DA CLASSE Pais
  List<Pais> dados = [];

   //CARREGAR DADOS DO ARQUIVO JSON
  carregarDados() async {
    final String arq = await rootBundle.loadString('lib/data/paises.json');
    final dynamic d = await json.decode(arq);
    setState(() {
      d.forEach((item) {
        dados.add(Pais.fromJson(item));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await carregarDados();
    });
  }


  @override
  Widget build(BuildContext context) {
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
        // LISTVIEW
        //
        child: ListView.builder(
            //QUANTIDADE DE ITENS
            itemCount: dados.length, 
            //APARÊNCIA DE CADA ITEM
            itemBuilder: (context, index) {
              return Card(
                shadowColor: Colors.red,
                elevation: 10,
                child: ListTile(
                  leading: Icon(Icons.public, size: 30),
                  title: Text(dados[index].nome),
                  subtitle: Text('Capital ${dados[index].capital}'),
                  trailing: Icon(Icons.arrow_right, size: 30),

                  //EVENTO DE CLIQUE
                  hoverColor: Colors.blue,
                  onTap: (){
                    //
                    // NAVEGAÇÃO
                    //
                    var obj = dados [index];

                    Navigator.pushNamed(
                      context, 
                      't2',
                      arguments: obj,

                      );
                  },
                ),
              );
            }),
      ),
    );
  }
}