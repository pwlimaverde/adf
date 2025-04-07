import 'package:collection/collection.dart';


class Registro {
  final String colecao;
  final String documento;
  final Registro? subColecao;
  final Map<String, dynamic>? dados;
  Registro({
    required this.colecao,
    required this.documento,
    this.subColecao,
    this.dados,
  });

  Registro copyWith({
    String? colecao,
    String? documento,
    Registro? subColecao,
    Map<String, dynamic>? dados,
  }) {
    return Registro(
      colecao: colecao ?? this.colecao,
      documento: documento ?? this.documento,
      subColecao: subColecao ?? this.subColecao,
      dados: dados ?? this.dados,
    );
  }
  @override
  String toString() {
    return 'Registro(colecao: $colecao, documento: $documento, subColecao: $subColecao, dados: $dados)';
  }

  @override
  bool operator ==(covariant Registro other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;
  
    return 
      other.colecao == colecao &&
      other.documento == documento &&
      other.subColecao == subColecao &&
      mapEquals(other.dados, dados);
  }

  @override
  int get hashCode {
    return colecao.hashCode ^
      documento.hashCode ^
      subColecao.hashCode ^
      dados.hashCode;
  }
}
