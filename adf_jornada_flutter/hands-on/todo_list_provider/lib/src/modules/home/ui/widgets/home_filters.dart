import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/utilites/theme_extensions.dart';
import '../../features/filtro_tasks/domain/model/filtro_tasks_enum.dart';
import '../../features/filtro_tasks/domain/model/total_tasks_model.dart';
import '../home_controller.dart';
import 'todo_card_filters.dart';

class HomeFilters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FILTROS',
          style: context.titleStyle,
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TodoCardFilters(
                filtroTasksEnum: FiltroTasksEnum.hoje,
                totalTasksModel: TotalTasksModel(
                  totalTasks: 8,
                  totalTasksFinish: 4,
                ),
              ),
              TodoCardFilters(
                filtroTasksEnum: FiltroTasksEnum.amanha,
                totalTasksModel: TotalTasksModel(
                  totalTasks: 10,
                  totalTasksFinish: 10,
                ),
              ),
              TodoCardFilters(
                filtroTasksEnum: FiltroTasksEnum.semana,
                totalTasksModel: TotalTasksModel(
                  totalTasks: 20,
                  totalTasksFinish: 7,
                ),
              ),
              TodoCardFilters(
                filtroTasksEnum: FiltroTasksEnum.mes,
                totalTasksModel: TotalTasksModel(
                  totalTasks: 10,
                  totalTasksFinish: 1,
                ),
              ),
              TodoCardFilters(
                filtroTasksEnum: FiltroTasksEnum.todas,
                totalTasksModel: TotalTasksModel(
                  totalTasks: 10,
                  totalTasksFinish: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
