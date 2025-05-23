import 'package:flutter/material.dart';
import 'add_treino.dart';
import 'dadosTreino.dart';
import 'cronometro.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: PaginaInicial()));
}

class PaginaInicial extends StatefulWidget {
  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  DadosTreino dados = DadosTreino();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("App de treino pro Heitor ficar sheipado"),
        leading: Icon(Icons.fitness_center, size: 45.0),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cronometro()),
              );
            },
            icon: Icon(Icons.timer, size: 35),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: dados.getExercicios().length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(dados.getExercicios()[index]),
              subtitle: Text("wlndbwçjd"),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaginaAddTreino()),
          );
        },
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
