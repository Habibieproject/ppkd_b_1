import 'package:flutter/material.dart';
import 'package:ppkd_b_1/controller/counter_provider.dart';
import 'package:ppkd_b_1/views/auth/login_screen.dart';
import 'package:ppkd_b_1/views/auth/splash_screen.dart';
import 'package:ppkd_b_1/views/main/homepage.dart';
import 'package:ppkd_b_1/views/main/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
        // brightness: Brightness.dark,
        primaryColor: Colors.blueAccent,
        fontFamily: "Baloo_2",
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: SplashScreen(),
      // home: MainScreen(),
    );
  }
}
