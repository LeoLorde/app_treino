import 'package:flutter/material.dart';
import 'add_treino.dart';

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
      body: ListView(
        children: [
          Center(
            child: Text(
              "STATUS",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 100),
          Center(
            child: Text(
              "Exercícios segunda:",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              "Exercícios terça:",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              "Exercícios quarta:",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              "Exercícios quinta:",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              "Exercícios sexta:",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
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

class PaginaMeuTreino extends StatefulWidget {
  @override
  State<PaginaMeuTreino> createState() => _PaginaMeuTreinoState();
}

class _PaginaMeuTreinoState extends State<PaginaMeuTreino> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("wifonwiof")));
  }
}
