import 'package:auto_route/auto_route.dart';
import 'package:connectinno_case/controller/theme_controller_provider.dart';
import 'package:connectinno_case/core/router/auto_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectinno_case/controller/note_controller.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(noteControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ana Sayfa'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: ref.watch(themeModeProvider) == ThemeMode.light
                ? IconButton(
                    icon: const Icon(Icons.dark_mode),
                    onPressed: () {
                      ref.read(themeModeProvider.notifier).toggleTheme();
                    },
                  )
                : IconButton(
                    icon: const Icon(Icons.light_mode),
                    onPressed: () {
                      ref.read(themeModeProvider.notifier).toggleTheme();
                    },
                  ),
          ),
        ],
      ),

      body: notes.isEmpty
          ? const Center(child: Text("Henüz not eklenmedi."))
          : ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    onTap: () {
                      if (note.id == null) {
                        return;
                      }
                      context.pushRoute(DetailRoute(note: note));
                    },
                    trailing: IconButton(
                      onPressed: () {
                        if (note.id == null) {
                          return;
                        }
                        ref
                            .read(noteControllerProvider.notifier)
                            .deleteNote(note.id!);
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                    title: Text(note.title ?? "(Başlik yok)"),
                    subtitle: Text(
                      note.note ?? "(İçerik yok)",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushRoute(const NoteRoute());
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
