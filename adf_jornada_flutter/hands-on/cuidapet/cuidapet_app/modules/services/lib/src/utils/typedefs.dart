import 'package:dependencies/dependencies.dart';


typedef FAService = UsecaseBase<FirebaseAuth>;
typedef FRCService = UsecaseBase<FirebaseRemoteConfig>;

typedef EsService = UsecaseBaseCallData<ExternalStorage, ExternalStorage>;
typedef EsServiceData = Datasource<ExternalStorage>;

typedef LSService = UsecaseBaseCallData<LocalStorage, LocalStorage>;
typedef LSServiceData = Datasource<LocalStorage>;

typedef RCCService = UsecaseBaseCallData<RestClientCuidaPet, RestClientCuidaPet>;
typedef RCCServiceData = Datasource<RestClientCuidaPet>;

typedef ALService = UsecaseBaseCallData<AppLogger, AppLogger>;
typedef ALServiceData = Datasource<AppLogger>;