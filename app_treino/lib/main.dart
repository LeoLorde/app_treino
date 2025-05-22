import 'package:flutter/material.dart';
import 'add_treino.dart';
import 'dadosTreino.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: PaginaInicial()));
}

class PaginaInicial extends StatefulWidget {
  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("App de treino pro Heitor ficar sheipado"),
        leading: Icon(Icons.fitness_center, size: 45.0),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Text(
              "Meus Treinos",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: DadosTreino.exerciciosDisponiveis.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(DadosTreino.diasSemana[index]),
              subtitle: Text(DadosTreino.exerciciosDisponiveis[index]),
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
