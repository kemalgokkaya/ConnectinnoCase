import 'package:connectinno_case/data/database_helper.dart';
import 'package:connectinno_case/model/note_model.dart';

class NoteDao {
  Future<void> insertNote(Note note) async {
    final db = await DatabaseHelper.instance.database;
    await db.insert("notes", note.toMap());
  }

  Future<List<Note>> getNotes() async {
    final db = await DatabaseHelper.instance.database;
    final data = await db.query("notes");
    return data.map((e) => Note.fromMap(e)).toList();
  }

  Future<void> deleteNote(String id) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete("notes", where: "id = ?", whereArgs: [id]);
  }
}
