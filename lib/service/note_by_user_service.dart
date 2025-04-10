import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ppkd_b_1/views/main/home/note_by_user/models/note_by_user_model.dart';

class NoteByUserService {
  final CollectionReference _noteCollection = FirebaseFirestore.instance
      .collection('notes_by_user');

  // **1️⃣ Menambah Catatan berdasarkan UID pengguna**
  Future<void> addNote(NoteByUserModel note) async {
    await _noteCollection
        .doc('naruo123')
        .collection("entries")
        .add(note.toMap())
        .then(
          (c) {},
          onError: (v) {
            print(v);
          },
        );
  }

  // **2️⃣ Mengambil Semua Catatan Hanya Milik Pengguna yang Login**
  Stream<List<NoteByUserModel>> getNotesByUser(String uid) {
    return _noteCollection.doc().collection("entries").snapshots().map((
      snapshot,
    ) {
      return snapshot.docs.map((doc) {
        return NoteByUserModel.fromMap(
          doc.data() as Map<String, dynamic>,
          doc.id,
        );
      }).toList();
    });
  }

  // **3️⃣ Update Status Ceklis pada Catatan**
  Future<void> updateNoteStatus(
    String uid,
    String noteId,
    bool isChecked,
  ) async {
    await _noteCollection
        .doc('naruo123')
        .collection("entries")
        .doc(noteId)
        .update({'isChecked': isChecked});
  }

  // **4️⃣ Hapus Catatan**
  Future<void> deleteNote(String uid, String noteId) async {
    await _noteCollection
        .doc('naruo123')
        .collection("entries")
        .doc(noteId)
        .delete();
  }
}
