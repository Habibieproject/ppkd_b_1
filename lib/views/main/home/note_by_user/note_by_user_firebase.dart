import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ppkd_b_1/service/note_by_user_service.dart';
import 'package:ppkd_b_1/views/main/home/note_by_user/models/note_by_user_model.dart';

class NoteByUserScreen extends StatefulWidget {
  @override
  _NoteByUserScreenState createState() => _NoteByUserScreenState();
}

class _NoteByUserScreenState extends State<NoteByUserScreen> {
  final NoteByUserService _noteByUserService = NoteByUserService();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  String? _userUid;

  @override
  void initState() {
    super.initState();
    _userUid = FirebaseAuth.instance.currentUser?.uid;
  }

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
                if (_userUid != null) {
                  _noteByUserService.addNote(
                    NoteByUserModel(
                      id: '',
                      uid: _userUid!,
                      title: _titleController.text,
                      description: _descController.text,
                      isChecked: false,
                    ),
                  );
                }
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
      body:
          _userUid == null
              ? Center(child: Text("Harap login untuk melihat catatan."))
              : StreamBuilder<List<NoteByUserModel>>(
                stream: _noteByUserService.getNotesByUser(_userUid!),
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
                            _noteByUserService.updateNoteStatus(
                              _userUid.toString(),
                              note.id,
                              newValue ?? false,
                            );
                          },
                        ),
                        onLongPress: () {
                          _noteByUserService.deleteNote(
                            _userUid.toString(),
                            note.id,
                          );
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
