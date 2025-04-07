import 'package:dependencies/dependencies.dart';

import 'features/features_initial_loading.dart';
import 'features/firebase_init/datasource/firebase_init_datasource.dart';
import 'features/firebase_init/domain/usecase/firebase_init_usecase.dart';
import 'features/widgets_flutter_binding/datasource/widgets_flutter_binding_datasource.dart';
import 'features/widgets_flutter_binding/domain/usecase/widgets_flutter_binding_usecase.dart';
import 'utils/typedefs.dart';

final autoInjector = AutoInjector();

final class InitialLoadingBindings {
  void initBindings() {
    final bindings = AutoInjector(
      tag: 'initial_bindings',
      on: (i) {
        i.add<FbServiceData>(FirebaseInitDatasource.new);
        i.add<FbService>(FirebaseInitUsecase.new);
        i.add<WidServiceData>(WidgetsFlutterBindingDatasource.new);
        i.add<WidService>(WidgetsFlutterBindingUsecase.new);
        i.commit();
      },
    );
    autoInjector.addInstance<FeaturesInitialLoading>(FeaturesInitialLoading(
        fbService: bindings.get<FbService>(),
        widService: bindings.get<WidService>()));
    autoInjector.commit();
  }
}
