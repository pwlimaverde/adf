import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/utilites/theme_extensions.dart';
import '../../features/filtro_tasks/domain/model/filtro_tasks_enum.dart';
import '../../features/filtro_tasks/domain/model/total_tasks_model.dart';
import '../home_controller.dart';

class TodoCardFilters extends StatelessWidget {
  final FiltroTasksEnum filtroTasksEnum;
  final TotalTasksModel? totalTasksModel;

  const TodoCardFilters({
    super.key,
    this.totalTasksModel,
    required this.filtroTasksEnum,
  });
  @override
  Widget build(BuildContext context) {
    final selecionado = context.select<HomeController, FiltroTasksEnum>(
                        (value) => value.filtroSelecionado) ==
                    filtroTasksEnum;
    return Container(
      constraints: BoxConstraints(
        minHeight: 120,
        maxWidth: 150,
      ),
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: selecionado ? context.primaryColor:Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.8),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Text(
            '${totalTasksModel?.totalTasks ?? 0} TASKS',
            style: context.titleStyle.copyWith(
              fontSize: 10,
              color: selecionado ? Colors.white : Colors.grey,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            filtroTasksEnum.descricao,
            style: context.titleStyle.copyWith(
              fontSize: 20,
              color:  selecionado ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Container(
              width: 110,
              height: 6,
              child: TweenAnimationBuilder<double>(
                tween: Tween(
                  begin: 0.0,
                  end: _getPercentFinish(),
                ),
                duration: Duration(seconds: 1),
                builder: (context, value, child) {
                  return LinearProgressIndicator(
                    backgroundColor: selecionado? context.primaryColorLight:Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation<Color>(selecionado? Colors.white :context.primaryColor),
                    value: value,
                    minHeight: 5,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  double _getPercentFinish() {
    final total = totalTasksModel?.totalTasks ?? 0.0;
    final finish = totalTasksModel?.totalTasksFinish ?? 0.1;
    if (totalTasksModel == 0) {
      return 0;
    }
    final percent = (finish * 100)/total;
    return percent/100;
  
  }
}