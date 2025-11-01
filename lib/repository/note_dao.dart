import 'package:connectinno_case/repository/database_base_repository.dart';
import 'package:sqflite/sqflite.dart';

class Note {
  final String id;
  final String? title;
  final String? content;

  Note({required this.id, this.title, this.content});

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as String,
      title: map['title'] as String?,
      content: map['content'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'content': content};
  }
}

class NoteDao {
  final String _table = 'notes';

  Future<Database> get _db async =>
      await DatabaseBaseRepository.instance.database;

  Future<void> insertNote(Note note) async {
    final db = await _db;
    await db.insert(
      _table,
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateNote(Note note) async {
    final db = await _db;
    return await db.update(
      _table,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> deleteNote(String id) async {
    final db = await _db;
    return await db.delete(_table, where: 'id = ?', whereArgs: [id]);
  }

  Future<Note?> getNoteById(String id) async {
    final db = await _db;
    final maps = await db.query(
      _table,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isNotEmpty) return Note.fromMap(maps.first);
    return null;
  }

  Future<List<Note>> getAllNotes() async {
    final db = await _db;
    final maps = await db.query(_table, orderBy: 'rowid DESC');
    return maps.map((m) => Note.fromMap(m)).toList();
  }
}
