import 'package:flutter/material.dart';
import 'package:ppkd_b_1/views/auth/login_screen.dart';
import 'package:ppkd_b_1/views/main/homepage.dart';
import 'package:ppkd_b_1/views/main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginScreen(),
      // home: MainScreen(),
    );
  }
}
