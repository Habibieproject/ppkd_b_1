import 'package:flutter/material.dart';
import 'package:ppkd_b_1/data/map_name.dart';
import 'package:ppkd_b_1/views/main/home/home_screen.dart';
import 'package:ppkd_b_1/views/main/stack/widgets/layouting/gridview.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key, required this.email, required this.phone});
  final String email;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.feed)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          title: const Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [
            GridviewScreen(),
            HomeScreen(email: email, phone: phone),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
