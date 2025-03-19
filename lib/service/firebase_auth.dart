import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ppkd_b_1/service/note.dart';
import 'package:ppkd_b_1/service/pref_handler.dart';
import 'package:ppkd_b_1/service/user_service.dart';
import 'package:ppkd_b_1/utils/toast.dart';
import 'package:ppkd_b_1/views/auth/models/register_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final UserService _userService = UserService();
  // Mapping error message dari Firebase ke pesan yang lebih jelas
  String _handleFirebaseError(String errorCode) {
    switch (errorCode) {
      case "invalid-email":
        return "Format email tidak valid!";
      case "user-not-found":
        return "Akun tidak ditemukan, silakan daftar terlebih dahulu!";
      case "wrong-password":
        return "Password salah, coba lagi!";
      case "email-already-in-use":
        return "Email ini sudah terdaftar, silakan login!";
      case "weak-password":
        return "Gunakan password minimal 6 karakter!";
      case "too-many-requests":
        return "Terlalu banyak percobaan login, coba lagi nanti!";
      default:
        return "Terjadi kesalahan, coba lagi nanti.";
    }
  }

  // Login User dengan validasi dan switch-case error handling
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        showToast("Email dan password harus diisi!");
        return "empty_fields";
      }

      await _auth.signInWithEmailAndPassword(email: email, password: password);
      showToast("Login berhasil!", success: true);
      return "success";
    } on FirebaseAuthException catch (e) {
      String errorMessage = _handleFirebaseError(e.code);
      showToast(errorMessage);
      return e.code;
    } catch (e) {
      print(e);
      showToast("Terjadi kesalahan tak terduga!");
      return "unexpected_error";
    }
  }

  // Sign Up User dengan validasi dan switch-case error handling
  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        showToast("Email dan password harus diisi!");
        return "empty_fields";
      }

      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      // Simpan data ke Firestore
      await _userService.saveUserData(
        UserModel(
          uid: userCredential.user!.uid,
          name: name,
          email: email,
          phone: phone,
        ),
      );
      PreferenceHandler.saveId(userCredential.user!.uid);
      showToast("Pendaftaran berhasil!", success: true);
      return "success";
    } on FirebaseAuthException catch (e) {
      String errorMessage = _handleFirebaseError(e.code);
      showToast(errorMessage);
      return e.code;
    } catch (e) {
      showToast("Terjadi kesalahan tak terduga!");
      return "unexpected_error";
    }
  }

  // Google Sign-In
  Future<String> signInWithGoogle() async {
    try {
      // Memulai proses login dengan Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        showToast("Login Google dibatalkan.");
        return "cancelled";
      }

      // Mengambil authentication token
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      // Login ke Firebase dengan credential dari Google
      await _auth.signInWithCredential(credential);
      await _userService.saveUserData(
        UserModel(
          uid: userCredential.user!.uid.toString(),
          name: userCredential.user!.displayName.toString(),
          email: userCredential.user!.email.toString(),
          phone:
              userCredential.user != null
                  ? userCredential.user!.phoneNumber.toString()
                  : "0",
        ),
      );
      PreferenceHandler.saveId(userCredential.user!.uid);
      showToast("Login Google berhasil!", success: true);
      return "success";
    } on FirebaseAuthException catch (e) {
      String errorMessage = _handleFirebaseError(e.code);
      showToast(errorMessage);
      return e.code;
    } catch (e) {
      print(e);
      showToast("Terjadi kesalahan tak terduga!");
      return "unexpected_error";
    }
  }

  // Logout User
  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    showToast("Logout berhasil!", success: true);
  }
}
