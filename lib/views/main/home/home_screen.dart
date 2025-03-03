import 'package:flutter/material.dart';
import 'package:ppkd_b_1/data/list_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.email, required this.phone});
  final String email;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Instagram')),

      body: Column(
        children: [
          Text("email $email"),
          Text("phone $phone"),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider();
              },
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              // scrollDirection: Axis.horizontal,
              itemCount: listName.length,
              itemBuilder: (BuildContext context, int index) {
                final dataName = listName[index];
                return Text(dataName, style: TextStyle(fontSize: 20));
              },
            ),
          ),
        ],
      ),
    );
  }
}
