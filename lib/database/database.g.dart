// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CatDao? _catDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Cat` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `age` TEXT NOT NULL, `breed` TEXT NOT NULL, `owner` TEXT NOT NULL, `date` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CatDao get catDao {
    return _catDaoInstance ??= _$CatDao(database, changeListener);
  }
}

class _$CatDao extends CatDao {
  _$CatDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _catInsertionAdapter = InsertionAdapter(
            database,
            'Cat',
            (Cat item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'age': item.age,
                  'breed': item.breed,
                  'owner': item.owner,
                  'date': item.date
                }),
        _catUpdateAdapter = UpdateAdapter(
            database,
            'Cat',
            ['id'],
            (Cat item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'age': item.age,
                  'breed': item.breed,
                  'owner': item.owner,
                  'date': item.date
                }),
        _catDeletionAdapter = DeletionAdapter(
            database,
            'Cat',
            ['id'],
            (Cat item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'age': item.age,
                  'breed': item.breed,
                  'owner': item.owner,
                  'date': item.date
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Cat> _catInsertionAdapter;

  final UpdateAdapter<Cat> _catUpdateAdapter;

  final DeletionAdapter<Cat> _catDeletionAdapter;

  @override
  Future<List<Cat>> findAllCats() async {
    return _queryAdapter.queryList('SELECT * FROM Cat',
        mapper: (Map<String, Object?> row) => Cat(
            name: row['name'] as String,
            age: row['age'] as String,
            breed: row['breed'] as String,
            owner: row['owner'] as String,
            date: row['date'] as String));
  }

  @override
  Future<Cat?> findCatById(String id) async {
    return _queryAdapter.query('SELECT * FROM Cat WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Cat(
            name: row['name'] as String,
            age: row['age'] as String,
            breed: row['breed'] as String,
            owner: row['owner'] as String,
            date: row['date'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertCat(Cat cat) async {
    await _catInsertionAdapter.insert(cat, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCat(Cat cat) async {
    await _catUpdateAdapter.update(cat, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCat(Cat cat) async {
    await _catDeletionAdapter.delete(cat);
  }
}
