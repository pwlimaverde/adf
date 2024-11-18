import 'package:provider/provider.dart';
import '../core/utils/module.dart';
import '../core/utils/routes.dart';

import '../sevices/features/features_service_presenter.dart';
import '../sevices/features/local_storage/domain/interface/local_storage.dart';
import 'features/create_task/domain/usecase/create_task_usecase.dart';
import 'features/features_tasks_presenter.dart';
import 'ui/task_create/task_create_controller.dart';
import 'ui/task_create/task_create_page.dart';
import 'utils/typedefs.dart';

final class TasksModule extends Module {
  TasksModule()
      : super(
          bindings: [
            Provider<LocalStorage>(
              create: (_) => FeaturesServicePresenter.to.localStorage,
              lazy: true,
            ),
            
            Provider<CTusecase>(
              create: (context) => CreateTaskUsecase(
                context.read<LocalStorage>(),
              ),
              lazy: true,
            ),
            Provider<FeaturesTaskPresenter>(
              create: (context) => FeaturesTaskPresenter(
                createTask: context.read<CTusecase>(),
              ),
              lazy: true,
            ),
            ChangeNotifierProvider(
              create: (context) => TaskCreateController(
                featuresTaskPresenter: context.read<FeaturesTaskPresenter>(),
              ),
              lazy: false,
            ),
          ],
          routes: {
            Routes.task_create.caminho: (context) => TaskCreatePage(
                  controller: context.read<TaskCreateController>(),
                ),
          },
        );
}
