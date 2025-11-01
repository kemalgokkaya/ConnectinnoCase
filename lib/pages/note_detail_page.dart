import 'package:auto_route/auto_route.dart';
import 'package:connectinno_case/model/note_model.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.note});
  final NoteModel note;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Not Detay')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.note.title ?? "Başlıksız",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              widget.note.note ?? "İçerik yok",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
