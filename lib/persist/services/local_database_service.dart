import 'package:dicoding_flutter_fundamental/persist/entity/restaurant_entity.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseService {
  static const String _databaseName = 'eatsease-app.db';
  static const String _tableName = 'restaurant';
  static const int _version = 1;

  Future<void> createTables(Database database) async {
    await database.execute(
      """CREATE TABLE $_tableName(
        id TEXT PRIMARY KEY,
        name TEXT,
        city TEXT,
        pictureId TEXT,
        rating REAL
      )
      """,
    );
  }

  Future<Database> _initializeDb() async {
    return openDatabase(
      _databaseName,
      version: _version,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  Future<int> insertItem(RestaurantEntity restaurant) async {
    final db = await _initializeDb();
    final data = restaurant.toJson();
    final id = await db.insert(
      _tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  Future<int> removeItem(String id) async {
    final db = await _initializeDb();
    final result = await db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    return result;
  }

  Future<List<RestaurantEntity>> getAllItems() async {
    final db = await _initializeDb();
    final results = await db.query(_tableName);
    return results.map((result) => RestaurantEntity.fromJson(result)).toList();
  }
}
