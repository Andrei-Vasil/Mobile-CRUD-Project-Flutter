import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import '../dao/cat_dao.dart';
import '../model/cat.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Cat])
abstract class AppDatabase extends FloorDatabase {
  CatDao get catDao;
}
