enum FiltroTasksEnum {
  hoje('DE HOJE'),
  amanha('DE AMANHÃ'),
  semana('DA SEMANA'),
  mes('DO MÊS'),
  todas('TODAS');

  final String descricao;

  const FiltroTasksEnum(this.descricao);
}