import 'package:flutter/material.dart';
import 'package:ppkd_b_1/data/model_name.dart';

class ListWithModel extends StatelessWidget {
  const ListWithModel({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listNameModelData.length,
      itemBuilder: (BuildContext context, int index) {
        final dataName = listNameModelData[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(dataName.nameSchool, style: TextStyle(fontSize: 30)),
            Text(dataName.address, style: TextStyle(fontSize: 20)),
          ],
        );
      },
    );
  }
}
