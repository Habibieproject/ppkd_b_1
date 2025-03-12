import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class RandomPickerProvider extends ChangeNotifier {
  List<String> allNames = []; // Semua nama dari JSON
  List<String> availableNames = []; // Nama yang masih bisa dipilih
  List<String> eliminatedNames = []; // Nama yang sudah dipilih
  String selectedName = "Tekan tombol untuk memilih";
  bool isPicking = false;
  final Random random = Random();
  Timer? _timer;
  ConfettiController confettiController = ConfettiController(
    duration: Duration(seconds: 5),
  );

  RandomPickerProvider() {
    _loadNamesFromAssets();
  }

  Future<void> _loadNamesFromAssets() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/names.json',
      );
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      allNames = List<String>.from(jsonData["names"]);
      availableNames = List<String>.from(allNames);
      eliminatedNames.clear();
      notifyListeners();
    } catch (e) {
      selectedName = "Gagal memuat nama!";
      notifyListeners();
    }
  }

  void pickRandomName() {
    if (availableNames.isEmpty || isPicking) return;

    isPicking = true;
    notifyListeners();

    int count = 0;
    int totalCycles = 20; // Efek tegang (jumlah pergantian nama)
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      selectedName = availableNames[random.nextInt(availableNames.length)];
      notifyListeners();

      count++;
      if (count >= totalCycles) {
        timer.cancel();
        confettiController.play();

        _finalizePick();
      }
    });
  }

  void _finalizePick() {
    if (availableNames.isEmpty) return;

    selectedName = availableNames.removeAt(
      random.nextInt(availableNames.length),
    );
    eliminatedNames.insert(
      0,
      selectedName,
    ); // Masukkan ke daftar eliminasi di atas
    isPicking = false;
    notifyListeners();
  }

  void resetPicker() {
    availableNames = List<String>.from(allNames);
    eliminatedNames.clear();
    selectedName = "Tekan tombol untuk memilih";
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
