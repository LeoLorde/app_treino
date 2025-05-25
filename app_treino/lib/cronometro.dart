import 'dart:async';
import 'package:flutter/material.dart';
import 'add_treino.dart';
import 'dadosTreino.dart';
import 'main.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: PaginaInicial()));
}

class Cronometro extends StatefulWidget {
  @override
  State<Cronometro> createState() => _CronometroState();
}

class _CronometroState extends State<Cronometro> {
  bool _isStart = false;
  String _stopwatchText = "00:00:00";
  final _stopwatch = new Stopwatch();
  final _timeout = const Duration(milliseconds: 30);

  void _startTimeout() {
    new Timer(_timeout, _handleTimeout);
  }

  void _handleTimeout() {
    if (_stopwatch.isRunning) {
      _startTimeout();
    }
    setState(() {
      _setStopwatchText();
    });
  }

  void _startStopButtomPressed() {
    setState(() {
      if (_stopwatch.isRunning) {
        _isStart = false;
        _stopwatch.stop();
      } else {
        _isStart = true;
        _stopwatch.start();
        _startTimeout();
      }
    });
  }

  void _resetButtomPressed() {
    if (_stopwatch.isRunning) {
      _startStopButtomPressed();
    }
    setState(() {
      _stopwatch.reset();
      _setStopwatchText();
    });
  }

  void _setStopwatchText() {
    _stopwatchText =
        (_stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
        ':' +
        (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0') +
        ':' +
        (((_stopwatch.elapsed.inMilliseconds % 1000) % 99) + 1)
            .toString()
            .padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text("Cronômetro")),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: FittedBox(
            fit: BoxFit.none,
            child: Text(
              _stopwatchText,
              style: TextStyle(
                fontSize: 72,
                fontFeatures: [FontFeature.tabularFigures()],
              ),
            ),
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 60,
                width: 120,
                child: ElevatedButton(
                  onPressed: _startStopButtomPressed,
                  child: Icon(
                    _isStart ? Icons.pause : Icons.play_arrow,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                height: 60,
                width: 120,
                child: ElevatedButton(
                  onPressed: _resetButtomPressed,
                  child: Icon(Icons.stop, color: Colors.blue, size: 40),
                ),
              ),
              SizedBox(height: 400),
            ],
          ),
        ),
      ],
    );
  }
}
