import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:ppkd_b_1/views/main/home/profile_firebase/model/profile_firebase.dart';

class UserProfileService {
  final CollectionReference _userCollection = FirebaseFirestore.instance
      .collection('user_profiles');

  final FirebaseStorage _storage = FirebaseStorage.instance;

  // **1️⃣ Upload Gambar ke Firebase Storage**
  Future<String?> uploadImage(String uid, XFile imageFile) async {
    try {
      Reference ref = _storage.ref().child(
        'user_images/$uid/${imageFile.name}',
      );
      UploadTask uploadTask = ref.putFile(File(imageFile.path));
      TaskSnapshot snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print("Error Upload Image: $e");
      return null;
    }
  }

  // **2️⃣ Tambah Data Pengguna**
  Future<void> addUserProfile(UserProfileModel userProfile) async {
    await _userCollection.add(userProfile.toMap());
  }

  // **3️⃣ Ambil Semua Data Pengguna**
  Stream<List<UserProfileModel>> getUserProfiles(String uid) {
    return _userCollection.where('uid', isEqualTo: uid).snapshots().map((
      snapshot,
    ) {
      return snapshot.docs.map((doc) {
        return UserProfileModel.fromMap(
          doc.data() as Map<String, dynamic>,
          doc.id,
        );
      }).toList();
    });
  }

  // **4️⃣ Update Data Pengguna**
  Future<void> updateUserProfile(
    String docId,
    Map<String, dynamic> updatedData,
  ) async {
    await _userCollection.doc(docId).update(updatedData);
  }

  // **5️⃣ Hapus Data Pengguna**
  Future<void> deleteUserProfile(String docId) async {
    await _userCollection.doc(docId).delete();
  }
}
