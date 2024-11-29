import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import '../../../core/ui/utilites/notifier/defaut_listner_notifier.dart';
import '../../../core/ui/utilites/theme_extensions.dart';
import '../../../core/ui/widgets/field_padrao.dart';
import '../../../home/features/filtro_tasks/domain/model/task_model.dart';
import 'task_update_controller.dart';
import 'widgets/calendar_button.dart';

final class TaskUpdatePage extends StatefulWidget {
  final TaskUpdateController _controller;
  final TaskModel _taskModel;

  const TaskUpdatePage({
    super.key,
    required TaskUpdateController controller,
    required TaskModel taskModel,
  })  : _controller = controller,
        _taskModel = taskModel;

  @override
  State<TaskUpdatePage> createState() => _TaskUpdatePageState();
}

class _TaskUpdatePageState extends State<TaskUpdatePage> {
  final _descriptionEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    final defautListener = DefautListnerNotifier(widget._controller);
    defautListener.listener(
        context: context,
        successCallback: (notifier, listenerInstance) {
          listenerInstance.dispose();
          Navigator.of(context).pop();
        });
    _descriptionEC.text = widget._taskModel.descricao;
    widget._controller.selectedDateAtual = widget._taskModel.dataHora;
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[50],
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.close,
              color: context.primaryColor,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: context.primaryColor,
        onPressed: () {
          final formMalid = _formKey.currentState?.validate() ?? false;
          if (formMalid) {
            widget._controller.updateTask(
                id: widget._taskModel.id, descricao: _descriptionEC.text, finalizado: widget._taskModel.finalizado);
          }
        },
        label: const Text(
          'Atualizar task',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.grey[50],
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          color: Colors.grey[50],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Atualizar Atividade',
                  style: context.titleStyle.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              FieldPadrao(
                label: '',
                controller: _descriptionEC,
                validator: Validatorless.required('Descrição é obrigatória!'),
              ),
              const SizedBox(
                height: 20,
              ),
              CalendarButton(),
            ],
          ),
        ),
      ),
    );
  }
}
