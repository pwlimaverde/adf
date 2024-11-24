import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../tasks/tasks_module.dart';
import '../../features/filtro_tasks/domain/model/task_model.dart';
import '../home_controller.dart';

class Tasks extends StatefulWidget {
  final HomeController _controller;
  final TaskModel _taskModel;

  const Tasks({
    super.key,
    required TaskModel taskModel,
    required HomeController controller,
  }) : _taskModel = taskModel, _controller = controller;

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final dateFormat = DateFormat(
    'dd/MM/yyyy',
  );

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
        child: InkWell(
          onTap: () {
            _goToTaskUpdate(context: context, taskModel: widget._taskModel);
          },
          borderRadius: BorderRadius.circular(20),
          child: ListTile(
            leading: Checkbox(
              value: widget._taskModel.finalizado,
              onChanged: (value) {},
            ),
            title: Text(
              widget._taskModel.descricao,
              style: TextStyle(
                  decoration: widget._taskModel.finalizado
                      ? TextDecoration.lineThrough
                      : null),
            ),
            subtitle: Text(
              dateFormat.format(widget._taskModel.dataHora),
              style: TextStyle(
                  decoration: widget._taskModel.finalizado
                      ? TextDecoration.lineThrough
                      : null),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(width: 1)),
          ),
        ),
      ),
    );
  }

  Future<void> _goToTaskUpdate({
    required BuildContext context,
    required TaskModel taskModel,
  }) async {
    await Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          animation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInQuad,
          );
          return ScaleTransition(
            scale: animation,
            alignment: Alignment.bottomRight,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) =>
            TasksModule().getPage(
          context: context,
          routeName: '/task/update',
        ),
        settings: RouteSettings(arguments: taskModel),
      ),
    );
    await widget._controller.refreshPage();
  }
}
