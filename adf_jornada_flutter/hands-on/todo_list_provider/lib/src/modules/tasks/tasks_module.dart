import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/utils/module.dart';
import '../core/utils/routes.dart';

import '../home/features/filtro_tasks/domain/model/task_model.dart';
import '../sevices/features/features_service_presenter.dart';
import '../sevices/features/local_storage/domain/interface/local_storage.dart';
import 'features/create_task/domain/usecase/create_task_usecase.dart';
import 'features/features_tasks_presenter.dart';
import 'features/update_task/domain/usecase/update_task_usecase.dart';
import 'ui/task_create/task_create_controller.dart';
import 'ui/task_create/task_create_page.dart';
import 'ui/task_update/task_update_controller.dart';
import 'ui/task_update/task_update_page.dart';
import 'utils/typedefs.dart';

final class TasksModule extends Module {
  TasksModule()
      : super(
          bindings: [
            Provider<LocalStorage?>(
              create: (_) => FeaturesServicePresenter.to.localStorage,
              lazy: true,
            ),
            Provider<CTusecase>(
              create: (context) => CreateTaskUsecase(
                context.read<LocalStorage>(),
              ),
              lazy: true,
            ),
            Provider<UTusecase>(
              create: (context) => CheckTaskUsecase(
                context.read<LocalStorage>(),
              ),
              lazy: true,
            ),
            Provider<FeaturesTaskPresenter>(
              create: (context) => FeaturesTaskPresenter(
                createTask: context.read<CTusecase>(),
                updateTask: context.read<UTusecase>(),
              ),
              lazy: true,
            ),
            ChangeNotifierProvider(
              create: (context) => TaskUpdateController(
                featuresTaskPresenter: context.read<FeaturesTaskPresenter>(),
                featuresServicePresenter: FeaturesServicePresenter.to,
              ),
              lazy: false,
            ),
            ChangeNotifierProvider(
              create: (context) => TaskCreateController(
                featuresTaskPresenter: context.read<FeaturesTaskPresenter>(),
                featuresServicePresenter: FeaturesServicePresenter.to,
              ),
              lazy: false,
            ),
          ],
          routes: {
            Routes.taskCreate.caminho: (context) => TaskCreatePage(
                  controller: context.read<TaskCreateController>(),
                ),
            Routes.taskUpdate.caminho: (context) => TaskUpdatePage(
                  controller: context.read<TaskUpdateController>(),
                  taskModel: ModalRoute.of(context)!.settings.arguments as TaskModel,
                ),
          },
        );
}
