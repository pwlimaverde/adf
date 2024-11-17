import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../features/filtro_tasks/domain/model/task_model.dart';

class Tasks extends StatelessWidget {
  final TaskModel taskModel;
  final dateFormat = DateFormat(
    'dd/MM/yyyy',
  );
  Tasks({
    super.key,
    required this.taskModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            // spreadRadius: 2,
            // blurRadius: 5,
            // offset: Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      child: IntrinsicHeight(
        child: ListTile(
          leading: Checkbox(
            value: taskModel.finalizado,
            onChanged: (value) {},
          ),
          title: Text(
            taskModel.descricao,
            style:
                TextStyle(decoration: taskModel.finalizado ? TextDecoration.lineThrough : null),
          ),
          subtitle: Text(
            dateFormat.format(taskModel.dataHora),
            style:
                TextStyle(decoration: taskModel.finalizado ? TextDecoration.lineThrough : null),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(width: 1)),
        ),
      ),
    );
  }
}
