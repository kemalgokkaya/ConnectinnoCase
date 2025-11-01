import 'package:auto_route/auto_route.dart';
import 'package:connectinno_case/controller/note_controller.dart';
import 'package:connectinno_case/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class NotePage extends ConsumerStatefulWidget {
  const NotePage({super.key});

  @override
  ConsumerState<NotePage> createState() => _NotePageState();
}

class _NotePageState extends ConsumerState<NotePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Note Page')),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: titleController,
                maxLength: 50,
                cursorColor: Colors.deepPurple,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Başlik",
                  hintText: "Not gir...",
                  prefixIcon: const Icon(Icons.edit),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.deepPurple),
                  ),
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: contentController,
                cursorColor: Colors.deepPurple,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Not",
                  hintText: "Not gir...",
                  prefixIcon: const Icon(Icons.edit),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.deepPurple),
                  ),
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(noteControllerProvider.notifier)
              .createNote(
                NoteModel(
                  title: titleController.text,
                  note: contentController.text,
                ),
              );
        },
        child: const Icon(Icons.save),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
