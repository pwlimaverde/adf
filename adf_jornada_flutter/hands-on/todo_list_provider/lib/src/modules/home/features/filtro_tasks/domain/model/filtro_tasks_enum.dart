enum FiltroTasksEnum {
  hoje('HOJE'),
  amanha('AMANHÃ'),
  semana('SEMANA'),
  mes('MÊS'),
  todas('TODAS');

  final String descricao;

  const FiltroTasksEnum(this.descricao);
}