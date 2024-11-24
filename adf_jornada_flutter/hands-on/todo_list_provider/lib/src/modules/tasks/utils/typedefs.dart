import 'package:return_success_or_error/return_success_or_error.dart';

import '../features/create_task/domain/model/create_tasks_model.dart';
import '../features/update_task/domain/model/create_tasks_model.dart';

typedef CTusecase =  UsecaseBase<CreateTasksModel>;

typedef UTusecase =  UsecaseBase<UpdateTasksModel>;
