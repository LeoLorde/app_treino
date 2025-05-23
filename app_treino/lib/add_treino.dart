import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'dadosTreino.dart';
import 'cronometro.dart';

class PaginaAddTreino extends StatefulWidget {
  @override
  State<PaginaAddTreino> createState() => _PaginaAddTreinoState();
}

class _PaginaAddTreinoState extends State<PaginaAddTreino> {
  final TextEditingController controllernome = TextEditingController();

  @override
  void initState() {
    super.initState();
    for (var dia in DadosTreino.diasSemana) {
      DadosTreino.treinosSelecionados[dia] = {
        for (var ex in DadosTreino.diasSemana) ex: false,
      };
    }
    _loadTreinos();
  }

  Future<void> _loadTreinos() async {
    final prefs = await SharedPreferences.getInstance();
    for (var dia in DadosTreino.diasSemana) {
      Map<String, bool> exercicios = {
        for (var ex in DadosTreino.diasSemana)
          ex: prefs.getBool('$dia-$ex') ?? false,
      };
      DadosTreino.treinosSelecionados[dia] = exercicios;
    }
    setState(() {});
  }

  Future<void> _salvarTreinos() async {
    final prefs = await SharedPreferences.getInstance();
    for (var dia in DadosTreino.diasSemana) {
      for (var ex in DadosTreino.diasSemana) {
        await prefs.setBool(
          '$dia-$ex',
          DadosTreino.treinosSelecionados[dia]![ex]!,
        );
      }
    }
  }

  bool temExercicio(String dia) {
    return DadosTreino.treinosSelecionados[dia]!.values.any((v) => v == true);
  }

  String _gerarResumoTreinos() {
    List<String> linhas = [];

    for (var dia in DadosTreino.diasSemana) {
      var ativos =
          DadosTreino.treinosSelecionados[dia]!.entries
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Adicionar Treino"),
      ),
      body: Column(
        children: [
          Container(
            height: 80.0,
            width: 160.0,
            child: TextField(
              controller: controllernome,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Nome do treino',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: DadosTreino.diasSemana.length,
              itemBuilder: (context, index) {
                String dia = DadosTreino.diasSemana[index];
                return ExpansionTile(
                  title: Text(
                    dia,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: [
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children:
                          DadosTreino.exerciciosDisponiveis.map((exercicio) {
                            bool selecionado =
                                DadosTreino
                                    .treinosSelecionados[dia]?[exercicio] ??
                                false;
                            return ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  DadosTreino
                                          .treinosSelecionados[dia]![exercicio] =
                                      !selecionado;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    selecionado ? Colors.green : null,
                              ),
                              child: Text(
                                exercicio,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _gerarResumoTreinos(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  bool todosDiasComTreino = DadosTreino.diasSemana.every(
                    (dia) => temExercicio(dia),
                  );
                  if (todosDiasComTreino) {
                    await _salvarTreinos();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Treino salvo com sucesso!'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    setState(() {
                      Navigator.pop(context);
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Tem que treinar todo dia seu frango!'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Text("Salvar", style: TextStyle(color: Colors.black)),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    for (var dia in DadosTreino.diasSemana) {
                      DadosTreino.treinosSelecionados[dia]!.updateAll(
                        (key, value) => false,
                      );
                    }
                  });
                },
                child: Text("Limpar", style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class Treino {
  String nome;

  Treino(this.nome);
}
