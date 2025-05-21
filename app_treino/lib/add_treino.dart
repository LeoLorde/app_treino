import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class PaginaAddTreino extends StatefulWidget {
  @override
  State<PaginaAddTreino> createState() => _PaginaAddTreinoState();
}

class _PaginaAddTreinoState extends State<PaginaAddTreino> {
  final List<String> diasSemana = [
    'Segunda-feira',
    'Terça-feira',
    'Quarta-feira',
    'Quinta-feira',
    'Sexta-feira',
  ];

  final List<String> exerciciosDisponiveis = [
    'Quadríceps',
    'Posterior',
    'Peito',
    'Ombro',
    'Tríceps',
    'Bíceps',
    'Costas',
    'Cardio',
    'Ante-braço',
    'Abdómen',
  ];

  Map<String, Map<String, bool>> treinosSelecionados = {};

  @override
  void initState() {
    super.initState();
    for (var dia in diasSemana) {
      treinosSelecionados[dia] = {
        for (var ex in exerciciosDisponiveis) ex: false,
      };
    }
    _loadTreinos();
  }

  Future<void> _loadTreinos() async {
    final prefs = await SharedPreferences.getInstance();
    for (var dia in diasSemana) {
      Map<String, bool> exercicios = {
        for (var ex in exerciciosDisponiveis)
          ex: prefs.getBool('$dia-$ex') ?? false,
      };
      treinosSelecionados[dia] = exercicios;
    }
    setState(() {});
  }

  Future<void> _salvarTreinos() async {
    final prefs = await SharedPreferences.getInstance();
    for (var dia in diasSemana) {
      for (var ex in exerciciosDisponiveis) {
        await prefs.setBool('$dia-$ex', treinosSelecionados[dia]![ex]!);
      }
    }
  }

  bool temExercicio(String dia) {
    return treinosSelecionados[dia]!.values.any((v) => v == true);
  }

  String _gerarResumoTreinos() {
    List<String> linhas = [];

    for (var dia in diasSemana) {
      var ativos =
          treinosSelecionados[dia]!.entries
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
          Expanded(
            child: ListView.builder(
              itemCount: diasSemana.length,
              itemBuilder: (context, index) {
                String dia = diasSemana[index];
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
                          exerciciosDisponiveis.map((exercicio) {
                            bool selecionado =
                                treinosSelecionados[dia]?[exercicio] ?? false;
                            return ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  treinosSelecionados[dia]![exercicio] =
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
                  bool todosDiasComTreino = diasSemana.every(
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
                    for (var dia in diasSemana) {
                      treinosSelecionados[dia]!.updateAll(
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
