import 'package:dependencies/dependencies.dart';

import '../features/rest_client_cuidapet_api/domain/interface/rest_client_cuidapet.dart';

typedef FAService = UsecaseBase<FirebaseAuth>;
typedef FRCService = UsecaseBase<FirebaseRemoteConfig>;

typedef EsService = UsecaseBaseCallData<ExternalStorage, ExternalStorage>;
typedef EsServiceData = Datasource<ExternalStorage>;

typedef RCCService = UsecaseBaseCallData<RestClientCuidaPet, RestClientCuidaPet>;
typedef RCCServiceData = Datasource<RestClientCuidaPet>;