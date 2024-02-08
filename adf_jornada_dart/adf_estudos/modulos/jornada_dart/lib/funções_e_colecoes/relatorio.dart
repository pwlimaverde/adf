// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'pessoa.dart';

class Relatorio {
  final List<String> listaBruta;
  Relatorio({
    required this.listaBruta,
  });

  List<Pessoa> getPessoas() {
    final pessoasFinal = listaBruta
        .map((pessoa) {
          final nome = pessoa.split("|")[0];
          final idade = int.parse(pessoa.split("|")[1]);
          final sexo = Sexo.values.byName(pessoa.toLowerCase().split("|")[2]);

          return Pessoa(
            nome: nome,
            idade: idade,
            sexo: sexo,
          );
        })
        .toSet()
        .toList();

    pessoasFinal.sort(
      (a, b) => a.idade.compareTo(b.idade),
    );
    return pessoasFinal;
  }

  void showPessoas() {
    print("########## Relatorio gerencial das pessoas ##########");

    //! 1 - Remova os pacientes duplicados e apresente a nova lista
    print("Lista das pessoas:");
    getPessoas().forEach((element) {
      print("${getPessoas().indexOf(element) + 1} - $element");
    });
    print("\n");
  }

  void showPessoasPorSexo() {
    final pessoasMasculino = getPessoas()
        .where((element) => element.sexo == Sexo.masculino)
        .toList();
    final pessoasFeminino =
        getPessoas().where((element) => element.sexo == Sexo.feminino).toList();

    print(
        "########## Relatorio das quantidades de pessoas por sexo ##########");

    //! 2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas
    print("Pessoas do sexo Masculino:");
    print("Total de ${pessoasMasculino.length} homens");
    pessoasMasculino.forEach((element) {
      print("${pessoasMasculino.indexOf(element) + 1} - $element");
    });
    print("\n");

    print("Pessoas do sexo Feminino:");
    print("Total de ${pessoasFeminino.length} mulheres");
    pessoasFeminino.forEach((element) {
      print("${pessoasFeminino.indexOf(element) + 1} - $element");
    });
    print("\n");
  }

  void showPessoasaAdultas() {
    final pessoasMaiores =
        getPessoas().where((element) => element.idade >= 18).toList();

    print(
        "########## Relatorio das quantidades de pessoas maiores de 18 anos ##########");

    //! 2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas
    print("Lista das pessoas:");
    print("Total de ${pessoasMaiores.length} adultos");
    pessoasMaiores.forEach((element) {
      print("${pessoasMaiores.indexOf(element) + 1} - $element");
    });
    print("\n");
  }

  void showPessoaMaisVelha() {
    final pessoasMaisVelha = getPessoas().last;

    print("########## Relatorio da pessoa mais velha ##########");

    //! 2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas
    print(
        "A pessoa mais velha é: ${pessoasMaisVelha.nome}, ela tem ${pessoasMaisVelha.idade} anos e é do sexo ${pessoasMaisVelha.sexo}.");
    print("\n");
  }
}
