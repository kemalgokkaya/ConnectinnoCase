import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DatabaseBaseRepository {
  static final DatabaseBaseRepository instance = DatabaseBaseRepository._init();
  static Database? _database;

  DatabaseBaseRepository._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("notes.db");
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, fileName);

    return await openDatabase(
      path,
      version: 1,
      onConfigure: _onConfigure,
      onCreate: _createDB,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes(
        local_id INTEGER PRIMARY KEY,
        id INTEGER,
        title TEXT,
        note TEXT
      )
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {}

  Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
