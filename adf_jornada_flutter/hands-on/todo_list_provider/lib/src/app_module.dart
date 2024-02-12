import 'package:provider/provider.dart';

import 'modules/core/database/sqlite/sqlite_connection.dart';
import 'modules/core/utils/module.dart';

final class AppModule extends Module {
  AppModule()
      : super(
          bindings: [
            Provider(
              create: (_) => SqliteConnection(),
              lazy: false,
            )
          ],
          routers: {},
        );
}
