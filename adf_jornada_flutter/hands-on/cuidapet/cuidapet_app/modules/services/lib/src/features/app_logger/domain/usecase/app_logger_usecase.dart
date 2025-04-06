import 'package:dependencies/dependencies.dart';

final class AppLoggerUsecase extends UsecaseBaseCallData<
    AppLogger, AppLogger> {
  AppLoggerUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<AppLogger>> call(
      NoParams parameters) async {
    return await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );
  }
}
