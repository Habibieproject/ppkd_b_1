import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:ppkd_b_1/service/pref_handler.dart';
import 'package:ppkd_b_1/utils/constant/app_image.dart';
import 'package:ppkd_b_1/views/auth/login_screen.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({super.key});

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IntroductionScreen(
        showNextButton: true,
        showDoneButton: true,
        onDone: () {
          PreferenceHandler.saveLookWelcoming(true);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        done: const Text(
          'Done',
          style: TextStyle(color: Colors.black54, fontSize: 22),
        ),
        dotsDecorator: const DotsDecorator(
          activeColor: Colors.black87,
          activeSize: Size(15, 15),
        ),
        next: const Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.black54,
          size: 30,
        ),
        globalBackgroundColor: Colors.white,
        pages: [
          pageviewmodel(
            'We provide high quality products for you',
            AppImage.introLogin,
          ),
          pageviewmodel(
            'Your satisfaction is our number one priority',
            AppImage.introCheck,
          ),
          pageviewmodel(
            "Let's fulfill your daily needs with Evira right now!",
            AppImage.introStore,
          ),
        ],
      ),
    );
  }

  PageViewModel pageviewmodel(String title, String image) {
    return PageViewModel(
      titleWidget: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black, fontSize: 32),
      ),
      body: '',
      image: Image.asset(image),
      decoration: const PageDecoration(
        imageFlex: 2,
        bodyFlex: 1,
        bodyPadding: EdgeInsets.zero,
        imagePadding: EdgeInsets.all(10),
      ),
    );
  }
}
