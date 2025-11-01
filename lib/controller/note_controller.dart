import 'package:connectinno_case/core/utils/logger.dart';
import 'package:connectinno_case/model/note_model.dart';
import 'package:connectinno_case/repository/note_dao.dart';
import 'package:connectinno_case/repository/note_repository.dart';
import 'package:connectinno_case/repository/secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class NoteController extends StateNotifier<List<NoteModel>> {
  final Ref ref;
  NoteController(this.ref) : super([]) {
    getNotes();
    getNotesRemote();
  }

  final NoteRepository _noteRepository = NoteRepository();
  final NoteDao noteDao = NoteDao();

  Future<void> getNotesRemote() async {
    try {
      final String? userId = await getUserIdFromSecureStorage();
      if (userId == null) return;
      final notes = await _noteRepository.getNotes(userId);
      final localNotes = await noteDao.getAllNotes();

      final localIds = localNotes.map((note) => note.id).toSet();

      // notes listesinden localIds'de olmayanları filtrele
      List<NoteModel> result = notes
          .where((note) => !localIds.contains(note.id))
          .toList();
      await Future.wait(result.map((element) => noteDao.insertNote(element)));
    } catch (e) {
      AppLogger.log("Notlar yüklenirken hata oluştur");
    } finally {
      getNotes();
    }
  }

  Future<List<NoteModel>?> getNotes() async {
    try {
      final notes = await noteDao.getAllNotes();
      state = notes;
      return state;
    } catch (e) {
      return state;
    }
  }

  Future<void> createNote(NoteModel note) async {
    try {
      int localId = await noteDao.insertNote(note);
      final String? userId = await getUserIdFromSecureStorage();
      if (userId == null) return;
      NoteModel response = await _noteRepository.createNote(note, userId);
      await noteDao.updateNote(response.copyWith(localId: localId));
    } catch (e) {
      AppLogger.log('createNote unexpected error: $e');
    } finally {
      await getNotes();
    }
  }

  Future<void> updateNote(NoteModel note) async {
    try {
      await noteDao.updateNote(note);
      final String? userId = await getUserIdFromSecureStorage();
      if (userId == null) return;
      await _noteRepository.updateNote(note, userId);
    } catch (e) {
      AppLogger.log('updateNote unexpected error: $e');
    } finally {
      await getNotes();
    }
  }

  Future<void> deleteNote(int id) async {
    try {
      await noteDao.deleteNote(id);

      final String? userId = await getUserIdFromSecureStorage();
      if (userId == null) return;
      await _noteRepository.deleteNote(id, userId);
    } catch (e) {
      AppLogger.log('deleteNote unexpected error: $e');
    } finally {
      await getNotes();
    }
  }
}

final noteControllerProvider =
    StateNotifierProvider<NoteController, List<NoteModel>>((ref) {
      return NoteController(ref);
    });
