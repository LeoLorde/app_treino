class DadosTreino {
  List<String> diasSemana = [
    'Segunda-feira',
    'Terça-feira',
    'Quarta-feira',
    'Quinta-feira',
    'Sexta-feira',
  ];

  List<String> exerciciosDisponiveis = [
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

  List getExercicios() {
    return exerciciosDisponiveis;
  }

  List getDias() {
    return diasSemana;
  }

  Map getSelecionados() {
    return treinosSelecionados;
  }
}
