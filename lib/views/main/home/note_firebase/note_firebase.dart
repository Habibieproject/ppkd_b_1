import 'package:flutter/material.dart';
import 'package:ppkd_b_1/service/note.dart';
import 'package:ppkd_b_1/views/main/home/note_firebase/models/notes_model.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final NoteService _noteService = NoteService();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  void _showAddNoteDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Tambah Catatan"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: "Judul"),
              ),
              TextField(
                controller: _descController,
                decoration: InputDecoration(labelText: "Deskripsi"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _titleController.clear();
                _descController.clear();
                Navigator.pop(context);
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                _noteService.addNote(
                  Note(
                    id: '',
                    title: _titleController.text,
                    description: _descController.text,
                    isChecked: false,
                  ),
                );
                _titleController.clear();
                _descController.clear();
                Navigator.pop(context);
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catatan Saya")),
      body: StreamBuilder<List<Note>>(
        stream: _noteService.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Belum ada catatan."));
          }

          final notes = snapshot.data!;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return ListTile(
                title: Text(
                  note.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(note.description),
                trailing: Checkbox(
                  value: note.isChecked,
                  onChanged: (newValue) {
                    _noteService.updateNoteStatus(note.id, newValue ?? false);
                  },
                ),
                onLongPress: () {
                  _noteService.deleteNote(note.id);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddNoteDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
