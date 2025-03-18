import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ppkd_b_1/utils/toast.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
  }) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        showToast("Email dan password harus diisi!");
        return "empty_fields";
      }

      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
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
}
