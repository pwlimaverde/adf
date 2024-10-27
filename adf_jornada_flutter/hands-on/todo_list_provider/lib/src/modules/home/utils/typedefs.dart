import 'package:return_success_or_error/return_success_or_error.dart';

import '../features/update_display_name/domain/model/update_display_name_model.dart';
import '../features/update_foto/domain/model/update_foto_model.dart';

typedef UDNusecase =  UsecaseBase<UpdateDisplayNameModel>;

typedef UFusecase =  UsecaseBaseCallData<UpdateFotoModel, UpdateFotoModel>;
typedef UFdata =  Datasource<UpdateFotoModel>;