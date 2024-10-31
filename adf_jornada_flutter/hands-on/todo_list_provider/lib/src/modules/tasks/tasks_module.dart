import 'package:provider/provider.dart';
import '../core/utils/module.dart';
import '../core/utils/routes.dart';

import '../sevices/features/features_service_presenter.dart';
import '../sevices/features/local_storage/domain/interface/local_storage.dart';
import 'ui/task_create/task_create_controller.dart';
import 'ui/task_create/task_create_page.dart';

final class TasksModule extends Module {
  TasksModule()
      : super(
          bindings: [
            Provider<LocalStorage>(
              create: (_) => FeaturesServicePresenter.to.localStorage,
              lazy: true,
            ),
            ChangeNotifierProvider(
              create: (context) => TaskCreateController(
                localStorage: context.read<LocalStorage>(),
              ),
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
