
import 'package:return_success_or_error/return_success_or_error.dart';


import '../model/update_foto_model.dart';

final class UpdateFotoUsecase extends UsecaseBaseCallData<UpdateFotoModel, UpdateFotoModel> {
  UpdateFotoUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<UpdateFotoModel>> call(NoParams parameters) {
   return resultDatasource(parameters: parameters, datasource: datasource);
  }
}
