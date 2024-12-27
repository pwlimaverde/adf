import 'package:dependencies/dependencies.dart';

typedef FAService = UsecaseBase<FirebaseAuth>;
typedef FRCService = UsecaseBase<FirebaseRemoteConfig>;

typedef EsService = UsecaseBaseCallData<ExternalStorage, ExternalStorage>;
typedef EsServiceData = Datasource<ExternalStorage>;