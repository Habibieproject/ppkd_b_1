import 'package:cloud_firestore/cloud_firestore.dart';

class NoteByUserModel {
  String id;
  String uid; // Tambahkan UID pengguna
  String title;
  String description;
  bool isChecked;
  Timestamp? createdAt;

  NoteByUserModel({
    required this.id,
    required this.uid,
    required this.title,
    required this.description,
    required this.isChecked,
    this.createdAt,
  });

  // Konversi dari Firestore ke Object
  factory NoteByUserModel.fromMap(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return NoteByUserModel(
      id: documentId,
      uid: data['uid'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      isChecked: data['isChecked'] ?? false,
      createdAt: data['createdAt'],
    );
  }

  // Konversi ke Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'title': title,
      'description': description,
      'isChecked': isChecked,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
    };
  }
}
