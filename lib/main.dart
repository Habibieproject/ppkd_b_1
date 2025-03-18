import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ppkd_b_1/controller/counter_provider.dart';
import 'package:ppkd_b_1/controller/random_picker_provider.dart';
import 'package:ppkd_b_1/firebase_options.dart';
import 'package:ppkd_b_1/utils/constant/app_color.dart';
import 'package:ppkd_b_1/views/auth/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => RandomPickerProvider()),
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
        primaryColor: AppColor.secondaryColor,
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
