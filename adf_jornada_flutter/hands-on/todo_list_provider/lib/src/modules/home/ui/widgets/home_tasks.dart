import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/utilites/theme_extensions.dart';
import '../../features/filtro_tasks/domain/model/task_model.dart';
import '../home_controller.dart';
import 'tasks.dart';

class HomeTasks extends StatelessWidget {
  const HomeTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Selector<HomeController, String>(selector: (context, controller) {
            return controller.filtroSelecionado.descricao;
          },builder: (context, value, child){
            return Text(
            value == 'TODAS' ? 'TODAS AS TASK\'S' : 'TASK\'S $value',
            style: context.titleStyle,
          );
          }, ),
          Column(
            children: context.select<HomeController, List<TaskModel>>(
              (controller)=>controller.tasksAtualFilter).map((task) => Tasks(taskModel: task,)).toList()
          ),
        ],
      ),
    );
  }
}
