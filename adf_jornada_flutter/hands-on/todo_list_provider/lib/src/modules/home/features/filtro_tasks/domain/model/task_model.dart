import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  final int id;
  final String descricao;
  final DateTime dataHora;
  final bool finalizado;
  TaskModel({
    required this.id,
    required this.descricao,
    required this.dataHora,
    required this.finalizado,
  });

  TaskModel copyWith({
    int? id,
    String? descricao,
    DateTime? dataHora,
    bool? finalizado,
  }) {
    return TaskModel(
      id: id ?? this.id,
      descricao: descricao ?? this.descricao,
      dataHora: dataHora ?? this.dataHora,
      finalizado: finalizado ?? this.finalizado,
    );
  }


  factory TaskModel.fromMapSqlite(Map<String, dynamic> map) {
    return TaskModel(
      id: (map['id'] ?? 0),
      descricao: (map['descricao'] ?? ''),
      dataHora: DateTime.parse(map['data_hora']),
      finalizado: map['finalizado'] == 1,
    );
  }

  @override
  String toString() {
    return 'TaskModel(id: $id, descricao: $descricao, dataHora: $dataHora, finalizado: $finalizado)';
  }

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.descricao == descricao &&
      other.dataHora == dataHora &&
      other.finalizado == finalizado;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      descricao.hashCode ^
      dataHora.hashCode ^
      finalizado.hashCode;
  }
}
