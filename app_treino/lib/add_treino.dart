import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: PaginaInicial()));
}

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
    'Perna',
    'Peito',
    'Cardio',
    'Costas',
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
  }

  bool temExercicio(String dia) {
    return treinosSelecionados[dia]!.values.any((v) => v == true);
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
                                treinosSelecionados[dia]![exercicio]!;
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  bool todosDiasComTreino = diasSemana.every(
                    (dia) => temExercicio(dia),
                  );
                  if (todosDiasComTreino) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Treino salvo com sucesso!'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.pop(context);
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
