import 'package:get_it/get_it.dart';


import 'features/features_initial_loading.dart';


import 'features/firebase_init/datasource/firebase_init_datasource.dart';
import 'features/firebase_init/domain/usecase/firebase_init_usecase.dart';

import 'features/widgets_flutter_binding/datasource/widgets_flutter_binding_datasource.dart';
import 'features/widgets_flutter_binding/domain/usecase/widgets_flutter_binding_usecase.dart';
import 'utils/typedefs.dart';

final class InitialLoadingBindings {
  final getIt = GetIt.I;
  Future<void> initBindings() async {
    getIt.registerFactory<WidServiceData>(
      () => WidgetsFlutterBindingDatasource(),
    );
    getIt.registerFactory<WidService>(
      () => WidgetsFlutterBindingUsecase(
        getIt.get<WidServiceData>(),
      ),
    );
    getIt.registerFactory<FbServiceData>(
      () => FirebaseInitDatasource(),
    );
    getIt.registerFactory<FbService>(
      () => FirebaseInitUsecase(
        getIt.get<FbServiceData>(),
      ),
    );

    getIt.registerSingleton<FeaturesInitialLoading>(FeaturesInitialLoading(
      fbService: getIt.get<FbService>(),
      widService: getIt.get<WidService>(),
    ));
  }
}
