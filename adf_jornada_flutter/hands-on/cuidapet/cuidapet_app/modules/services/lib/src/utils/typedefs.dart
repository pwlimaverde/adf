import 'package:dependencies/dependencies.dart';

typedef FAService = UsecaseBase<FirebaseAuth>;

typedef EsService = UsecaseBaseCallData<ExternalStorage, ExternalStorage>;
typedef EsServiceData = Datasource<ExternalStorage>;