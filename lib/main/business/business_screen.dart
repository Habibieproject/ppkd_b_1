import 'package:flutter/material.dart';
import 'package:ppkd_b_1/data/map_name.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Instagram')),
    
      body: ListView.builder(
        itemCount: listNameMap.length,
        itemBuilder: (BuildContext context, int index) {
          final dataName =listNameMap[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(dataName["name"], style: TextStyle(fontSize: 30),),
            Text(dataName["address"], style: TextStyle(fontSize: 20),),
          ],
        );
        },
      ),
    );
  }
}