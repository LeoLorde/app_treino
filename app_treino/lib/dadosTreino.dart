class DadosTreino {
  List<String> nomeTreino = [];

  static final DadosTreino _instancia = DadosTreino._interno();

  factory DadosTreino() {
    return _instancia;
  }

  DadosTreino._interno();

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

  final Map<String, Map<String, bool>> treinosSelecionados = {};

  void adicionarNomeTreino(String nome) {
    nomeTreino.add(nome);
  }

  List<String> getExercicios() {
    return exerciciosDisponiveis;
  }

  List<String> getDias() {
    return diasSemana;
  }

  List<String> getNomesTreinos() {
    return nomeTreino;
  }

  Map<String, Map<String, bool>> getSelecionados() {
    return treinosSelecionados;
  }
}
