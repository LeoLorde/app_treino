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
  Map<String, bool> exerciciosSeg = {
    'Perna': false,
    'Peito': false,
    'Cardio': false,
    'Costas': false,
  };
  Map<String, bool> exerciciosTer = {
    'Perna': false,
    'Peito': false,
    'Cardio': false,
    'Costas': false,
  };
  Map<String, bool> exerciciosQua = {
    'Perna': false,
    'Peito': false,
    'Cardio': false,
    'Costas': false,
  };
  Map<String, bool> exerciciosQui = {
    'Perna': false,
    'Peito': false,
    'Cardio': false,
    'Costas': false,
  };
  Map<String, bool> exerciciosSex = {
    'Perna': false,
    'Peito': false,
    'Cardio': false,
    'Costas': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Adicionar Treino"),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            title: Text(
              'Segunda-feira',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosSeg['Perna'] = !exerciciosSeg['Perna']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosSeg['Perna']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Perna",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosSeg['Peito'] = !exerciciosSeg['Peito']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosSeg['Peito']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Peito",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosSeg['Cardio'] = !exerciciosSeg['Cardio']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosSeg['Cardio']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Cardio",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosSeg['Costas'] = !exerciciosSeg['Costas']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosSeg['Costas']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Costas",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              'Terça-feira',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosTer['Perna'] = !exerciciosTer['Perna']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosTer['Perna']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Perna",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosTer['Peito'] = !exerciciosTer['Peito']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosTer['Peito']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Peito",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosTer['Cardio'] = !exerciciosTer['Cardio']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosTer['Cardio']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Cardio",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosTer['Costas'] = !exerciciosTer['Costas']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosTer['Costas']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Costas",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              'Quarta-feira',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosQua['Perna'] = !exerciciosQua['Perna']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosQua['Perna']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Perna",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosQua['Peito'] = !exerciciosQua['Peito']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosQua['Peito']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Peito",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosQua['Cardio'] = !exerciciosQua['Cardio']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosQua['Cardio']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Cardio",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosQua['Costas'] = !exerciciosQua['Costas']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosQua['Costas']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Costas",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              'Quinta-feira',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosQui['Perna'] = !exerciciosQui['Perna']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosQui['Perna']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Perna",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosQui['Peito'] = !exerciciosQui['Peito']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosQui['Peito']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Peito",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosQui['Cardio'] = !exerciciosQui['Cardio']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosQui['Cardio']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Cardio",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosQui['Costas'] = !exerciciosQui['Costas']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosQui['Costas']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Costas",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              'Sexta-feira',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosSex['Perna'] = !exerciciosSex['Perna']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosSex['Perna']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Perna",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosSex['Peito'] = !exerciciosSex['Peito']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosSex['Peito']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Peito",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosSex['Cardio'] = !exerciciosSex['Cardio']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosSex['Cardio']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Cardio",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciciosSex['Costas'] = !exerciciosSex['Costas']!;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            exerciciosSex['Costas']! ? Colors.green : null,
                      ),
                      child: Text(
                        "Costas",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (exerciciosQua == false &&
                      exerciciosTer == false &&
                      exerciciosQua == false &&
                      exerciciosQui == false &&
                      exerciciosSex == false) {
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
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    exerciciosSeg.updateAll((key, value) => false);
                    exerciciosTer.updateAll((key, value) => false);
                    exerciciosQua.updateAll((key, value) => false);
                    exerciciosQui.updateAll((key, value) => false);
                    exerciciosSex.updateAll((key, value) => false);
                  });
                },
                child: Text("Limpar", style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
