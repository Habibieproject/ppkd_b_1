// Menampilkan toast dengan pesan yang lebih user-friendly
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message, {bool success = false}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: success ? Colors.green : Colors.red,
    textColor: Colors.white,
  );
}
