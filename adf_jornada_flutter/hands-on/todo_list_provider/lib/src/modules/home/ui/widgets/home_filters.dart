import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/utilites/theme_extensions.dart';
import '../../features/filtro_tasks/domain/model/filtro_tasks_enum.dart';
import '../../features/filtro_tasks/domain/model/total_tasks_model.dart';
import '../home_controller.dart';
import 'todo_card_filters.dart';

class HomeFilters extends StatelessWidget {
  const HomeFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FILTROS',
          style: context.titleStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TodoCardFilters(
                filtroTasksEnum: FiltroTasksEnum.hoje,
                totalTasksModel: context.select<HomeController, TotalTasksModel?>(
                  (controller) => controller.hojeTotalTasks,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              TodoCardFilters(
                filtroTasksEnum: FiltroTasksEnum.amanha,
                totalTasksModel: context.select<HomeController, TotalTasksModel?>(
                  (controller) => controller.amanhaTotalTasks,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              TodoCardFilters(
                filtroTasksEnum: FiltroTasksEnum.semana,
                totalTasksModel: context.select<HomeController, TotalTasksModel?>(
                  (controller) => controller.semanaTotalTasks,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              TodoCardFilters(
                filtroTasksEnum: FiltroTasksEnum.mes,
                totalTasksModel: context.select<HomeController, TotalTasksModel?>(
                  (controller) => controller.mesTotalTasks,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              TodoCardFilters(
                filtroTasksEnum: FiltroTasksEnum.todas,
                totalTasksModel: context.select<HomeController, TotalTasksModel?>(
                  (controller) => controller.todasTotalTasks,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
