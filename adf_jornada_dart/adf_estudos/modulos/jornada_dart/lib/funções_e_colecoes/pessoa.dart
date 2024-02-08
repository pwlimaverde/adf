class Pessoa {
  final String nome;
  final int idade;
  final Sexo sexo;
  Pessoa({
    required this.nome,
    required this.idade,
    required this.sexo,
  });

  @override
  bool operator ==(covariant Pessoa other) {
    if (identical(this, other)) return true;

    return other.nome == nome && other.idade == idade && other.sexo == sexo;
  }

  @override
  int get hashCode => nome.hashCode ^ idade.hashCode ^ sexo.hashCode;

  @override
  String toString() => '$nome, $idade anos e do sexo ${sexo.name}';
}

enum Sexo {
  masculino,
  feminino,
}
