import 'package:flutter/material.dart';
import 'package:ppkd_b_1/controller/counter_provider.dart';
import 'package:ppkd_b_1/views/main/home/album/album_app.dart';
import 'package:ppkd_b_1/views/main/home/note_by_user/note_by_user_firebase.dart';
import 'package:ppkd_b_1/views/main/home/note_firebase/note_firebase.dart';
import 'package:ppkd_b_1/views/main/home/quiz/login_quiz.dart';
import 'package:ppkd_b_1/views/main/home/random/random_picker_screen.dart';
import 'package:ppkd_b_1/views/main/home/todo/todo_app.dart';
import 'package:ppkd_b_1/views/main/home/widgets/wa/chats.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.email, required this.phone});
  final String email;
  final String phone;
  @override
  Widget build(BuildContext context) {
    print("objsejhf");
    final counterProvider = Provider.of<CounterProvider>(context);

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
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TodoAppScreen(),
                        ),
                      );
                    },
                    child: Text("TODO"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RandomPickerScreen(),
                        ),
                      );
                    },
                    child: Text("Random Picker"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AlbumAppScreen(),
                        ),
                      );
                    },
                    child: Text("Album App"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => NoteScreen()),
                      );
                    },
                    child: Text("Note App"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NoteByUserScreen(),
                        ),
                      );
                    },
                    child: Text("Note by User App"),
                  ),
                  // counterProvider.loading == true
                  //     ? CircularProgressIndicator()
                  //     : Text(
                  //       "${counterProvider.counter}",
                  //       style: TextStyle(fontSize: 40),
                  //     ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     ElevatedButton(
                  //       onPressed: () {
                  //         counterProvider.decrement();
                  //       },
                  //       child: Text("-", style: TextStyle(fontSize: 40)),
                  //     ),
                  //     ElevatedButton(
                  //       onPressed: () {
                  //         counterProvider.increment();
                  //       },
                  //       child: Text("+", style: TextStyle(fontSize: 40)),
                  //     ),
                  // ],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
