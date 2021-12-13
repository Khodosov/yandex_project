import 'package:sqflite/sqflite.dart';
import 'package:yandex_project/domain/models/ingredient/ingredient_dto.dart';

class AppBDService {

  late Database database;

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> startDataBase() async {
    var databasesPath = await getDatabasesPath();
    String pathToDB = databasesPath + 'yBuhlishko.db';

    database = await openDatabase(pathToDB, version: 1,
        onConfigure: _onConfigure,
        onUpgrade: (db, oldVersion, newVersion) async {
        },
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute('PRAGMA foreign_keys=on;');
          await db.execute(
              'CREATE TABLE ingredients (id INTEGER PRIMARY KEY, name TEXT)');
        });
  }

  Future<void> insertAllIngredients(List<Ingredient> allData) async {
    try {
      var batch = database.batch();

      batch.delete('ingredients');

      //rewrite to insert from map
      allData.forEach((result) {
        batch.rawInsert(
            'INSERT INTO ingredients(id, name) VALUES(?, ?)',
            [
              result.id,
              result.name,
            ]);
      });

      await batch.commit();
    } catch (error) {
      //log("error");
    }
  }

  Future<dynamic> getIngredients() async {
    try {
      var list = await database.query(
          'ingredients', columns: ['id', 'name']);
      return list;
    } catch (error) {
      return [];
    }
  }

  Future<dynamic> getIngredientById(int ingredientId) async {
    try {
      var list = await getIngredientsWithCondition(
          'id = ?', [ingredientId]);
      return list;
    } catch (error) {
      return [];
    }
  }

  Future<dynamic> getIngredientsWithCondition(String condition, args) async {
    try {
      var list = await database.query(
          'ingredients', columns: ['id', 'name'],
          where: condition,
          whereArgs: args);
      return list;
    } catch (error) {
      return [];
    }
  }

  


}