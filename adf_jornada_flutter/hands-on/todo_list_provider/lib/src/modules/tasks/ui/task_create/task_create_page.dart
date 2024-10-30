import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/ui/utilites/theme_extensions.dart';
import '../../../core/ui/widgets/field_padrao.dart';
import '../../../sevices/features/local_storage/domain/interface/local_storage.dart';
import 'task_create_controller.dart';
import 'widgets/calendar_button.dart';

final class TaskCreatePage extends StatelessWidget {
  final TaskCreateController _controller;
  const TaskCreatePage({
    super.key,
    required TaskCreateController controller,
  }) : _controller = controller;

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
          final data = (date: DateTime.now(), description: 'teste segundo todo');

          context.read<LocalStorage>().write<({DateTime date, String description})>(key: 'todo', data: data);
        },
        label: Text(
          'Salvar task',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          color: Colors.grey[50],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Criar Atividade',
                  style: context.titleStyle.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FieldPadrao(
                label: '',
              ),
              SizedBox(
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
