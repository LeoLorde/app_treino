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
  final TextEditingController _controllersegunda = TextEditingController();
  final TextEditingController _controllerterca = TextEditingController();
  final TextEditingController _controllerquarta = TextEditingController();
  final TextEditingController _controllerquinta = TextEditingController();
  final TextEditingController _controllersexta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Adicionar Treino"),
      ),
      body: ListView(
        children: [
          Container(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Segunda-feira',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _controllersegunda,
                      decoration: InputDecoration(
                        hintText: "Digite os exercícios...",
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terça-feira',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _controllerterca,
                      decoration: InputDecoration(
                        hintText: "Digite os exercícios...",
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quarta-feira',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _controllerquarta,
                      decoration: InputDecoration(
                        hintText: "Digite os exercícios...",
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quinta-feira',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _controllerquinta,
                      decoration: InputDecoration(
                        hintText: "Digite os exercícios...",
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sexta-feira',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _controllersexta,
                      decoration: InputDecoration(
                        hintText: "Digite os exercícios...",
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_controllersegunda.text != "" &&
                      _controllerterca.text != "" &&
                      _controllerquarta.text != "" &&
                      _controllerquinta.text != "" &&
                      _controllersexta.text != "") {
                    Treino t = Treino(
                      _controllersegunda.text,
                      _controllerterca.text,
                      _controllerquarta.text,
                      _controllerquinta.text,
                      _controllersexta.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Treino salvo com sucesso!'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.pop(context, t);
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
                  _controllersegunda.text = "";
                  _controllerterca.text = "";
                  _controllerquarta.text = "";
                  _controllerquinta.text = "";
                  _controllersexta.text = "";
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

class Treino {
  String segunda;
  String terca;
  String quarta;
  String quinta;
  String sexta;

  Treino(this.segunda, this.terca, this.quarta, this.quinta, this.sexta);
}
