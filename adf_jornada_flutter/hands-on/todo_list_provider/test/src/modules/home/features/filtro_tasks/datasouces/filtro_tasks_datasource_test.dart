import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Teste de cconversão de data", () {
    final hoje = DateTime.now();
    var start = DateTime(2020, 1, 1, 0, 0, 0);
    var end = DateTime(hoje.year, hoje.month + 1, 1, 0, 0, 0)
        .add(Duration(days: 10 * 365));

    print(start);
    print(end);
  });
}

// (DateTime start, DateTime end) _getPeriodo(FiltroTasksEnum filtro){
//   switch (filtro) {
//     case FiltroTasksEnum.hoje:
//       final start = DateTime.now();
//       final end = DateTime.now();
//     case FiltroTasksEnum.amanha:
      
//     case FiltroTasksEnum.semana:
      
//     case FiltroTasksEnum.mes:
      
//   }
// }