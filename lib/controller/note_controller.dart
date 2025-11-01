import 'package:connectinno_case/core/utils/logger.dart';
import 'package:connectinno_case/model/note_model.dart';
import 'package:connectinno_case/repository/note_repository.dart';
import 'package:connectinno_case/repository/secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/legacy.dart';

class NoteController extends StateNotifier<List<NoteModel>> {
  final Ref ref;
  NoteController(this.ref) : super([]);

  final NoteRepository _noteRepository = NoteRepository();

  Future<List<NoteModel>?> _loadNotes() async {
    try {
      final String? userId = await getUserIdFromSecureStorage();
      if (userId == null) return null;
      final notes = await _noteRepository.getNotes(userId);
      state = notes;
      return state;
    } catch (e) {
      return state;
    }
  }

  Future<List<NoteModel>?> getNotes() async => await _loadNotes();

  Future<void> createNote(NoteModel note) async {
    try {
      final String? userId = await getUserIdFromSecureStorage();
      if (userId == null) return;
      await _noteRepository.createNote(note, userId);
      await _loadNotes();
    } on DioException catch (e) {
      // 405 veya diğer HTTP hatalarını yut, durumu güncelle ve konsola bilgi yaz
      final status = e.response?.statusCode;
      if (status == 405) {
        // Genelde sunucu tarafında uygun HTTP method/endpoint düzeltmesi gerekir.
        AppLogger.log(
          'createNote failed: 405 Method Not Allowed. Check endpoint or HTTP method.',
        );
      } else {
        AppLogger.log('createNote DioException: ${e.message}, status: $status');
      }
      // Tutarlı bir state için yeniden yüklemeyi dene
      await _loadNotes();
    } catch (e) {
      AppLogger.log('createNote unexpected error: $e');
      await _loadNotes();
    }
  }

  Future<void> updateNote(NoteModel note) async {
    try {
      final String? userId = await getUserIdFromSecureStorage();
      if (userId == null) return;
      await _noteRepository.updateNote(note, userId);
      state = [
        for (final n in state)
          if (n.id == note.id) note else n,
      ];
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      if (status == 405) {
        AppLogger.log(
          'updateNote failed: 405 Method Not Allowed. Check endpoint or HTTP method.',
        );
      } else {
        AppLogger.log('updateNote DioException: ${e.message}, status: $status');
      }
      // Sunucu ile uyumu sağlamak için yeniden yükle
      await _loadNotes();
    } catch (e) {
      AppLogger.log('updateNote unexpected error: $e');
      await _loadNotes();
    }
  }

  Future<void> deleteNote(int id) async {
    try {
      final String? userId = await getUserIdFromSecureStorage();
      if (userId == null) return;
      await _noteRepository.deleteNote(id, userId);
      state = state.where((n) => n.id != id).toList();
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      if (status == 405) {
        AppLogger.log(
          'deleteNote failed: 405 Method Not Allowed. Check endpoint or HTTP method.',
        );
      } else {
        AppLogger.log('deleteNote DioException: ${e.message}, status: $status');
      }
      await _loadNotes();
    } catch (e) {
      AppLogger.log('deleteNote unexpected error: $e');
      await _loadNotes();
    }
  }
}

final noteControllerProvider =
    StateNotifierProvider<NoteController, List<NoteModel>>((Ref ref) {
      return NoteController(ref);
    });
