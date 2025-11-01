import 'package:connectinno_case/repository/database_base_repository.dart';
import 'package:connectinno_case/model/note_model.dart';

class NoteDao {
  Future<void> insertNote(NoteModel note) async {
    final db = await DatabaseBaseRepository.instance.database;
    await db.insert("notes", note.toJson());
  }

  Future<List<NoteModel>> getNotes() async {
    final db = await DatabaseBaseRepository.instance.database;
    final data = await db.query("notes");
    return data.map((e) => NoteModel.fromJson(e)).toList();
  }

  Future<void> deleteNote(String id) async {
    final db = await DatabaseBaseRepository.instance.database;
    await db.delete("notes", where: "id = ?", whereArgs: [id]);
  }

  Future<void> putNote(NoteModel note) async {
    final db = await DatabaseBaseRepository.instance.database;
    await db.update(
      "notes",
      note.toJson(),
      where: "id = ?",
      whereArgs: [note.id],
    );
  }
}
