import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/* dummy database structure for download management
  database_db_structure.json
*/

class DatabaseProvider extends ChangeNotifier {
  Database? _db;

  DatabaseProvider() {
    openDb();
  }

  void openDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'my_db.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE downloads (id INTEGER PRIMARY KEY, name TEXT, path TEXT, height INTEGER, width INTEGER)',
        );
      },
    );
  }
}
