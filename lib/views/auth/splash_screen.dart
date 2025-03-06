import 'package:flutter/material.dart';
import 'package:ppkd_b_1/service/pref_handler.dart';
import 'package:ppkd_b_1/utils/constant/app_color.dart';
import 'package:ppkd_b_1/utils/constant/app_image.dart';
import 'package:ppkd_b_1/views/auth/login_screen.dart';
import 'package:ppkd_b_1/views/main/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  void getDataUser() async {
    // get data user
    var userId = await PreferenceHandler.getId();
    print(userId);
    Future.delayed(Duration(seconds: 2), () {
      if (userId != '') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(email: userId, phone: userId),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Image.asset(
          AppImage.logo,

          height: MediaQuery.of(context).size.width * 0.5,
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }
}
