import 'package:flutter/material.dart';
import 'package:ppkd_b_1/data/map_name.dart';
import 'package:ppkd_b_1/data/model_name.dart';

class SchoolScreen extends StatelessWidget {
  const SchoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Instagram')),
    
      body: ListView.builder(
        itemCount: listNameModelData.length,
        itemBuilder: (BuildContext context, int index) {
          final dataName =listNameModelData[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(dataName.nameSchool, style: TextStyle(fontSize: 30),),
            Text(dataName.address, style: TextStyle(fontSize: 20),),
          ],
        );
        },
      ),
    );
  }
}