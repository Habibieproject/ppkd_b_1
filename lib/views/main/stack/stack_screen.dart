import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("height");
    print(MediaQuery.maybeOf(context)!.size.height);
    print("width");
    print(MediaQuery.maybeOf(context)!.size.width);
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
        Container(
          height: MediaQuery.maybeOf(context)!.size.height,
          width: 400,
          color: Colors.red,
        ),
        Container(
          height: 200,
          width: 200,
          color: Colors.yellow,
        ),
         Container(
          height: 100,
          width: 100,
          color: Colors.green,
        ),
      ],),
    );
  }
}