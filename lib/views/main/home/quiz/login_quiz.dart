import 'package:flutter/material.dart';
import 'package:ppkd_b_1/views/main/home/quiz/detail_quiz.dart';

class LoginQuizScreen extends StatelessWidget {
  const LoginQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg_login_2.png",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Spacer(flex: 2),
                Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.cover,
                  height: 160,
                  width: 160,
                ),

                Spacer(flex: 1),
                Row(
                  children: [
                    Text(
                      "Enter your name",
                      style: TextStyle(
                        fontFamily: "Baloo_2",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "John Doe",
                    hintStyle: TextStyle(color: Colors.grey),

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
                Spacer(flex: 3),
                SizedBox(
                  width: double.infinity,
                  height: 59,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffF8C660),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailQuizScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Start",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
