import 'package:sqflite/sqflite.dart';

abstract interface class Migration {
  void create(Batch bath);
  void update(Batch bath);
}