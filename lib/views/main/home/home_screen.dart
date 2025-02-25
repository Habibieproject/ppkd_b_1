import 'package:flutter/material.dart';
import 'package:ppkd_b_1/data/list_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Instagram')),
    
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider();
        },
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        // scrollDirection: Axis.horizontal,
        itemCount: listName.length,
        itemBuilder: (BuildContext context, int index) {
          final dataName =listName[index];
        return Text(dataName, style: TextStyle(fontSize: 20),);
        },
      ),
    );
  }
}