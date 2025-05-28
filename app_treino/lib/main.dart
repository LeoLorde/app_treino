import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  Future<void> _loadNomesTreinos() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      dados.nomeTreino = prefs.getStringList('nomes_treinos') ?? [];
    });
  }

  String _gerarResumoTreinos() {
    DadosTreino dados = DadosTreino();
    List<String> linhas = [];

    //O que fazer aqui?
    for (String dia in dados.getDias()) {
      var ativos =
          dados
              .getSelecionados()[dia]!
              .entries
              .where((e) => e.value)
              .map((e) => e.key)
              .toList();
      if (ativos.isNotEmpty) {
        linhas.add("$dia: ${ativos.join(', ')}");
      }
    }

    return linhas.isEmpty
        ? "Nenhum treino selecionado ainda."
        : linhas.join("\n");
  }

  @override
  void initState() {
    super.initState();
    _loadNomesTreinos();
  }

  Widget build(BuildContext context) {
    DadosTreino dados = DadosTreino();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("GymHub"),
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
        itemCount: dados.nomeTreino.length,
        itemBuilder: (context, index) {
          String nome = dados.nomeTreino[index];
          return Card(
            child: ListTile(
              title: Text(nome),
              subtitle: Text(_gerarResumoTreinos()),
              trailing: IconButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  setState(() {
                    dados.nomeTreino.removeAt(index);
                  });
                  await prefs.setStringList('nomes_treinos', dados.nomeTreino);
                },
                icon: Icon(Icons.delete),
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          bool? resultado = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaginaAddTreino()),
          );
          if (resultado == true) {
            _loadNomesTreinos();
          }
        },
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
