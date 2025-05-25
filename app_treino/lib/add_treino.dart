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
    DadosTreino dados = DadosTreino();

    for (String dia in dados.getDias()) {
      dados.getSelecionados()[dia] = {
        for (String ex in dados.getExercicios()) ex: false,
      };
    }
    _loadTreinos();
    _loadNomesTreinos();
  }

  Future<void> _loadTreinos() async {
    DadosTreino dados = DadosTreino();

    final prefs = await SharedPreferences.getInstance();
    for (var dia in dados.getDias()) {
      Map<String, bool> exercicios = {
        for (var ex in dados.getExercicios())
          ex: prefs.getBool('$dia-$ex') ?? false,
      };
      dados.getSelecionados()[dia] = exercicios;
    }
    setState(() {});
  }

  Future<void> _salvarTreinos() async {
    DadosTreino dados = DadosTreino();

    final prefs = await SharedPreferences.getInstance();
    for (var dia in dados.getDias()) {
      for (var ex in dados.getExercicios()) {
        await prefs.setBool('$dia-$ex', dados.getSelecionados()[dia]![ex]!);
      }
    }
  }

  Future<void> _loadNomesTreinos() async {
    final prefs = await SharedPreferences.getInstance();
    DadosTreino dados = DadosTreino();

    dados.nomeTreino = prefs.getStringList('nomes_treinos') ?? [];
    setState(() {});
  }

  Future<void> _salvarNomeTreino(String nome) async {
    final prefs = await SharedPreferences.getInstance();
    String nome = controllernome.text.trim();

    if (nome.isEmpty) return;

    List<String> nomesTreinos = prefs.getStringList('nomes_treinos') ?? [];
    nomesTreinos.add(nome);
    await prefs.setStringList('nomes_treinos', nomesTreinos);

    setState(() {});
  }

  bool temExercicio(String dia) {
    DadosTreino dados = DadosTreino();
    return dados.getSelecionados()[dia]!.values.any((v) => v == true);
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
  Widget build(BuildContext context) {
    DadosTreino dados = DadosTreino();
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
              itemCount: dados.getDias().length,
              itemBuilder: (context, index) {
                String dia = dados.getDias()[index];
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
                          dados.getExercicios().map((exercicio) {
                            bool selecionado =
                                dados.getSelecionados()[dia]?[exercicio] ??
                                false;
                            return ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  dados.getSelecionados()[dia]![exercicio] =
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
                  await _loadNomesTreinos();
                  String nome = controllernome.text.trim();
                  if (nome.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Dê um nome ao treino seu frango!"),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }
                  bool todosDiasComTreino = dados.getDias().every(
                    (dia) => temExercicio(dia),
                  );
                  if (todosDiasComTreino) {
                    DadosTreino().adicionarNomeTreino(nome);
                    await _salvarNomeTreino(controllernome.text);
                    await _salvarTreinos();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Treino salvo com sucesso!'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    setState(() {
                      Navigator.pop(context, true);
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
                    for (var dia in dados.getDias()) {
                      dados.getSelecionados()[dia]!.updateAll(
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
