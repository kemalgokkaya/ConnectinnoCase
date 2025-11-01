import 'package:connectinno_case/core/enum/request_type.dart';
import 'package:connectinno_case/model/note_model.dart';
import 'package:connectinno_case/repository/base_repository.dart';
import 'package:dio/dio.dart';

class NoteRepository {
  final DataBaseRepository _baseRepository;

  static final NoteRepository _instance = NoteRepository._internal();

  factory NoteRepository() {
    return _instance;
  }
  NoteRepository._internal() : _baseRepository = DataBaseRepository();

  Future<List<NoteModel>> getNotes(String userId) async {
    Response response = await _baseRepository.executeRequest(
      RequestType.get,
      "/notes/$userId",
    );

    return (response.data as List)
        .map((element) => NoteModel.fromJson(element))
        .toList();
  }

  Future<NoteModel> createNote(NoteModel note, String userId) async {
    Response response = await _baseRepository.executeRequest(
      RequestType.post,
      "/note",
      body: {'title': note.title, 'note': note.note, "user_id": userId},
    );
    return NoteModel.fromJson(response.data);
  }

  Future<void> updateNote(NoteModel note, String userId) async {
    await _baseRepository.executeRequest(
      RequestType.put,
      "/note/$userId/${note.id}",
      body: {'title': note.title, 'content': note.note},
    );
  }

  Future<bool> deleteNote(int id, String userId) async {
    try {
      Response response = await _baseRepository.executeRequest(
        RequestType.delete,
        "/note/$userId/$id",
      );
      if (response.statusCode == null) return false;
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
