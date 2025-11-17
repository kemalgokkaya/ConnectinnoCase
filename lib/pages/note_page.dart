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
      appBar: AppBar(title: const Text('Create Notes')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
            child: TextField(
              controller: titleController,
              maxLength: 50,
              cursorColor: Colors.deepPurple,
              maxLines: 1,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 12,
                ),
                labelText: "Title",
                labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
                hintText: "Enter Title...",
                hintStyle: const TextStyle(fontSize: 12, color: Colors.black),
                prefixIcon: const Icon(Icons.edit, color: Colors.black),
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
            padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
            child: TextField(
              maxLength: 500,
              controller: contentController,
              cursorColor: Colors.deepPurple,
              maxLines: 5,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                labelText: "Not",
                labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
                hintText: "Not gir...",
                prefixIcon: const Icon(Icons.edit, color: Colors.black),
                filled: true,
                fillColor: Colors.grey.shade100,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                ),

                contentPadding: const EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 12,
                ),
              ),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
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
          context.back();
        },
        child: const Icon(Icons.save),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
