import 'package:flutter/material.dart';
import 'package:ppkd_b_1/views/main/business/business_screen.dart';
import 'package:ppkd_b_1/views/main/home/home_screen.dart';
import 'package:ppkd_b_1/views/main/school/school_screen.dart';
import 'package:ppkd_b_1/views/main/stack/profile_screen.dart';
import 'package:ppkd_b_1/views/main/stack/stack_screen.dart';

/// Flutter code sample for [BottomNavigationBar].

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.email, required this.phone});
  final String email;
  final String phone;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      HomeScreen(email: widget.email, phone: widget.phone),
      BusinessScreen(),
      SchoolScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      // appBar: AppBar(title: const Text('BottomNavigationBar Sample')),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),

      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              _onItemTapped(0);
            },
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              _onItemTapped(1);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart),
            label: 'Stack',
          ),
        ],

        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
