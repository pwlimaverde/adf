import '../../utils/migration.dart';
import 'migration/migration_v1.dart';
import 'migration/migration_v2.dart';
import 'migration/migration_v3.dart';

final class SqliteMigration {
  List<Migration> getCreateMigration()=>[
    MigrationV1(),
    MigrationV2(),
    MigrationV3(),
  ];
  List<Migration> getUpdateMigration(int oldVersion){
    var migrations = <Migration>[];
  }
  
}