import 'package:flutter/material.dart';
import 'package:ppkd_b_1/data/list_name.dart';
import 'package:ppkd_b_1/views/main/home/quiz/login_quiz.dart';
import 'package:ppkd_b_1/views/main/home/widgets/wa/chats.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.email, required this.phone});
  final String email;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My App')),

      body: Column(
        children: [
          Text("Hello $email", style: TextStyle(fontSize: 20)),

          Expanded(
            child: Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (context) => Chats()));
                    },
                    child: Text("WhatsApp"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginQuizScreen(),
                        ),
                      );
                    },
                    child: Text("QUIZ"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
