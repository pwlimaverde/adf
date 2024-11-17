import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/utilites/theme_extensions.dart';
import '../../features/filtro_tasks/domain/model/filtro_tasks_enum.dart';
import '../home_controller.dart';

class HomeWeekFilter extends StatelessWidget {
  const HomeWeekFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.select<HomeController, bool>(
        (controller) => controller.filtroSelecionado == FiltroTasksEnum.semana,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'DIA DA SEMANA',
            style: context.titleStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 95,
            child: DatePicker(
              DateTime.now(),
              locale: 'pt_BR',
              initialSelectedDate: DateTime.now(),
              selectionColor: context.primaryColor,
              selectedTextColor: Colors.white,
              daysCount: 7,
              monthTextStyle: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w500,
                color: context.primaryColor,
              ),
              dateTextStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: context.primaryColor,
              ),
              dayTextStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: context.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
