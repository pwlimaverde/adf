import 'package:return_success_or_error/return_success_or_error.dart';


import '../features/filtro_tasks/domain/model/task_model.dart';
import '../features/filtro_tasks/domain/model/tasks_maps_model.dart';
import '../features/get_periodo/domain/model/periodo_model.dart';
import '../features/home_update_task/domain/model/home_update_tasks_model.dart';
import '../features/update_display_name/domain/model/update_display_name_model.dart';
import '../features/update_foto/domain/model/update_foto_model.dart';

typedef UDNusecase =  UsecaseBase<UpdateDisplayNameModel>;


typedef GPusecase =  UsecaseBase<PeriodoModel>;

typedef UHTusecase =  UsecaseBase<HomeUpdateTasksModel>;

typedef UFusecase =  UsecaseBaseCallData<UpdateFotoModel, UpdateFotoModel>;
typedef UFdata =  Datasource<UpdateFotoModel>;

typedef FTusecase =  UsecaseBaseCallData<List<TaskModel>, TasksMapsModel>;
typedef FTdata =  Datasource<TasksMapsModel>;