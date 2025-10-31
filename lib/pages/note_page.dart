import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Note Page')),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                maxLength: 50,
                cursorColor: Colors.deepPurple,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Başlik",
                  hintText: "Not gir...",
                  prefixIcon: Icon(Icons.edit),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                ),
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              padding: EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.deepPurple,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Başlik",
                  hintText: "Not gir...",
                  prefixIcon: Icon(Icons.edit),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                ),
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.back();
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
