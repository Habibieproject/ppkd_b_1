import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ppkd_b_1/views/auth/models/register_user.dart';

class UserService {
  final CollectionReference _usersCollection = FirebaseFirestore.instance
      .collection('users');

  // Simpan data pengguna ke Firestore
  Future<void> saveUserData(UserModel user) async {
    await _usersCollection.doc(user.uid).set(user.toMap());
  }

  // Ambil data pengguna berdasarkan UID
  Future<UserModel?> getUserData(String uid) async {
    DocumentSnapshot doc = await _usersCollection.doc(uid).get();
    if (doc.exists) {
      return UserModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }
    return null;
  }
}
