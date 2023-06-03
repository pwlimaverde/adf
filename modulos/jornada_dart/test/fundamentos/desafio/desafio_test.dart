import 'package:flutter_test/flutter_test.dart';

void main() {
  //! Detalhe sobre a String
  //! A String é composta por 4 campos (Nome|Idade|Profissão|Estado onde mora)
  final pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|desenvolvedor|MG',
    'Sandra Silva|40|Desenvolvedor|MG',
    'Regina Verne|35|dentista|MG',
    'João Rahman|55|jornalista|SP',
  ];

  final listPacientes = pacientes
      .map(
        (item) => (
          nome: item.split("|")[0],
          idade: int.tryParse(item.split("|")[1]) ?? 0,
          profissao: item.split("|")[2],
          estado: item.split("|")[3],
        ),
      )
      .toList();

  final pacientesComMaisDe20Anos = listPacientes
      .where((item) {
        if (item.idade >= 20) {
          return true;
        } else {
          return false;
        }
      })
      .toList()
      .map((item) => "${item.nome} tem ${item.idade} anos")
      .toList();
  pacientesComMaisDe20Anos.sort(((a, b) => a.compareTo(b)));

  final quantidadeDesenvolvedor = listPacientes
      .where((item) {
        if (item.profissao.toLowerCase() == "desenvolvedor") {
          return true;
        } else {
          return false;
        }
      })
      .toList()
      .map((item) => item.nome)
      .toList();
  quantidadeDesenvolvedor.sort(((a, b) => a.compareTo(b)));

  final quantidadeEstudante = listPacientes
      .where((item) {
        if (item.profissao.toLowerCase() == "estudante") {
          return true;
        } else {
          return false;
        }
      })
      .toList()
      .map((item) => item.nome)
      .toList();
  quantidadeEstudante.sort(((a, b) => a.compareTo(b)));

  final quantidadeDentista = listPacientes
      .where((item) {
        if (item.profissao.toLowerCase() == "dentista") {
          return true;
        } else {
          return false;
        }
      })
      .toList()
      .map((item) => item.nome)
      .toList();
  quantidadeDentista.sort(((a, b) => a.compareTo(b)));

  final quantidadeJornalista = listPacientes
      .where((item) {
        if (item.profissao.toLowerCase() == "jornalista") {
          return true;
        } else {
          return false;
        }
      })
      .toList()
      .map((item) => item.nome)
      .toList();
  quantidadeJornalista.sort(((a, b) => a.compareTo(b)));

  final pacientesEmSP = listPacientes
      .where((item) {
        if (item.estado.toUpperCase() == "SP") {
          return true;
        } else {
          return false;
        }
      })
      .toList()
      .map((item) => item.nome)
      .toList();
  pacientesEmSP.sort(((a, b) => a.compareTo(b)));

  test('Teste relatorio', () {
    //! Baseado no array acima monte um relatório onde:
    print("########## Relatorio Gerencial dos Pacientes ##########");
    print("\n");
    //! 1 - Apresente os pacientes com mais de 20 anos e print o nome deles
    print("1 - Apresentação dos pacientes com mais de 20 anos:");
    pacientesComMaisDe20Anos.forEach(print);
    print("\n");
    //! 2 - Apresente quantos pacientes existem para cada profissão (desenvolvedor, estudante, dentista, jornalista)
    print("2 - Apresentação dos pacientes por profissão.");
    print("${quantidadeDesenvolvedor.length} são Desenvolvedores:");
    quantidadeDesenvolvedor.forEach(print);
    print("${quantidadeEstudante.length} são Estudantes:");
    quantidadeEstudante.forEach(print);
    print("${quantidadeDentista.length} são Dentistas:");
    quantidadeDentista.forEach(print);
    print("${quantidadeJornalista.length} são Jornalistas:");
    quantidadeJornalista.forEach(print);
    //! 3 - Apresente a quantidade de pacientes que moram em SP
    print("3 - Apresentação dos pacientes que moram em SP.");
    print("${pacientesEmSP.length} que moram em SP:");
    pacientesEmSP.forEach(print);
  });
}
