import 'package:connectinno_case/model/note_model.dart';
import 'package:connectinno_case/repository/database_base_repository.dart';
import 'package:sqflite/sqflite.dart';

class NoteDao {
  final String _table = 'notes';

  Future<Database> get _db async =>
      await DatabaseBaseRepository.instance.database;

  Future<int> insertNote(NoteModel note) async {
    final db = await _db;
    final response = await db.insert(
      _table,
      note.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return response;
  }

  Future<int> updateNote(NoteModel note) async {
    final db = await _db;
    return await db.update(
      _table,
      note.toJson(),
      where: 'local_id = ?',
      whereArgs: [note.localId],
    );
  }

  Future<int> deleteNote(int id) async {
    final db = await _db;
    return await db.delete(_table, where: 'id = ?', whereArgs: [id]);
  }

  Future<NoteModel?> getNoteById(String id) async {
    final db = await _db;
    final maps = await db.query(
      _table,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isNotEmpty) return NoteModel.fromJson(maps.first);
    return null;
  }

  Future<List<NoteModel>> getAllNotes() async {
    final db = await _db;
    final maps = await db.query(_table, orderBy: 'rowid DESC');
    return maps.map((m) => NoteModel.fromJson(m)).toList();
  }
}
