import 'package:flutter/material.dart';

class EditNotePage extends StatefulWidget {
  final String note;
  final int index;

  const EditNotePage({super.key, required this.note, required this.index});

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.note);
  }

  @override
  void dispose() {
    // Bersihkan controller saat widget disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Catatan")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Edit catatan",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text("Update"),
              onPressed: () {
                // Validasi
                if (_controller.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Catatan tidak boleh kosong!"),
                    ),
                  );
                } else {
                  Navigator.pop(context, _controller.text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
