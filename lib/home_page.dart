import 'package:flutter/material.dart';
import 'package:my_note_app/note_card.dart';
import 'package:my_note_app/add_note_page.dart';
import 'package:my_note_app/edit_note_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Catatan")),
      body: notes.isEmpty
          ? const Center(child: Text("Belum ada catatan."))
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return Dismissible(
                  key: ValueKey(note + index.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    // Handle swipe-to-delete
                    _deleteNote(index);
                  },
                  child: NoteCard(
                    note: note,
                    onTap: () => _editNote(context, note, index),
                    onDelete: () {
                      // Handle delete button press
                      _deleteNote(index);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigasi ke AddNotePage dan tunggu hasil
          final newNote = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNotePage()),
          );

          if (newNote != null && newNote is String) {
            setState(() {
              notes.add(newNote);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _editNote(BuildContext context, String note, int index) async {
    final updatedNote = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditNotePage(note: note, index: index),
      ),
    );

    if (updatedNote != null && updatedNote is String) {
      setState(() {
        notes[index] = updatedNote;
      });
    }
  }

  void _deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Catatan dihapus")));
  }
}
