import 'package:provider/provider.dart';
import '../core/utils/module.dart';
import '../core/utils/routes.dart';

import 'ui/task_create/task_create_controller.dart';
import 'ui/task_create/task_create_page.dart';

final class TasksModule extends Module {
  TasksModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (context) => TaskCreateController(),
              lazy: false,
            )
          ],
          routes: {
            Routes.task_create.caminho: (context) => TaskCreatePage(
                  controller: context.read<TaskCreateController>(),
                ),
          },
        );
}
