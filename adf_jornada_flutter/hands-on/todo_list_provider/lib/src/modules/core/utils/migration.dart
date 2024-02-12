import 'package:sqflite/sqflite.dart';

import '../database/sqlite/db_info.dart';

abstract interface class Migration {
  late final DbInfo dbInfo;

  void call(Batch bath);
}
