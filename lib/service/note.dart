import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ppkd_b_1/views/main/home/note_firebase/models/notes_model.dart';
import 'package:ppkd_b_1/views/main/home/note_firebase/note_firebase.dart';

class NoteService {
  final CollectionReference _noteCollection = FirebaseFirestore.instance
      .collection('notes');

  // **1️⃣ Menambah Catatan**
  Future<void> addNote(Note note) async {
    await _noteCollection.add(note.toMap());
  }

  // **2️⃣ Mengambil Semua Catatan**
  Stream<List<Note>> getNotes() {
    return _noteCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Note.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  // **3️⃣ Update Ceklis pada Catatan**
  Future<void> updateNoteStatus(String noteId, bool isChecked) async {
    await _noteCollection.doc(noteId).update({'isChecked': isChecked});
  }

  // **4️⃣ Hapus Catatan**
  Future<void> deleteNote(String noteId) async {
    await _noteCollection.doc(noteId).delete();
  }
}
