import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/utilites/theme_extensions.dart';
import '../../features/filtro_tasks/domain/model/filtro_tasks_enum.dart';
import '../home_controller.dart';

class HomeDataFilter extends StatelessWidget {
  const HomeDataFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return context.select<HomeController, Widget>((controller) {
      return Visibility(
        visible: controller.filtroSelecionado == FiltroTasksEnum.semana ||
            controller.filtroSelecionado == FiltroTasksEnum.mes,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              controller.filtroSelecionado == FiltroTasksEnum.semana
                  ? 'DIA DA SEMANA'
                  : 'DIA DO MÊS',
              style: context.titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 95,
              child: DatePicker(
                onDateChange: (dataSelecionada) {
                  controller.filtroPorData(dataSelecionada);
                },
                controller.dataInicial ?? DateTime.now(),
                locale: 'pt_BR',
                initialSelectedDate: controller.dataInicial ?? DateTime.now(),
                selectionColor: context.primaryColor,
                selectedTextColor: Colors.white,
                daysCount:
                    controller.filtroSelecionado == FiltroTasksEnum.semana
                        ? 7
                        : controller.dataFinal?.day ?? 0,
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
    });
  }
}
