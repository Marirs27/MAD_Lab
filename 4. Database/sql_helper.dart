import 'package:sqflite/sqflite.dart' as sql;
import 'package:flutter/foundation.dart';

class SqlHelper {
  static Future<void> createDatabase(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT,
      description TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP  
    )""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('myDb.db',version: 1,
      onCreate: (sql.Database database, int version) async {
        await createDatabase(database);
    }
    );
  }

  static Future<int> insertItem(String title, String? description) async {
    final db = await SqlHelper.db();
    final data = {'title': title, 'description': description};
    return await db.insert('items', data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<int> updateItem(int id, String title, String? description) async {
    final db = await SqlHelper.db();
    final data = {'title': title, 'description': description, 'createdAt': DateTime.now().toString()  };
    return await db.update('items', data, where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> deleteItem(int id) async {
    final db = await SqlHelper.db();
    try {
      await db.delete('items', where: 'id = ?', whereArgs: [id]);
    }
    catch (err) {
      debugPrint('Error : $err');
    }
  }

  static Future<List<Map<String,dynamic>>> getAll() async {
    final db = await SqlHelper.db();
    return await db.query('items', orderBy: 'id');
  }
}
