import 'package:flutter/material.dart';
import 'package:ppkd_b_1/data/map_name.dart';
import 'package:ppkd_b_1/views/main/business/widgets/checkbox.dart';
import 'package:ppkd_b_1/views/main/business/widgets/dropdownbutton.dart';
import 'package:ppkd_b_1/views/main/business/widgets/radiobutton.dart';
import 'package:ppkd_b_1/views/main/business/widgets/tabbar.dart';
import 'package:ppkd_b_1/views/main/home/home_screen.dart';
import 'package:ppkd_b_1/views/main/stack/profile_screen.dart';
import 'package:ppkd_b_1/views/main/stack/widgets/layouting/gridview.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key, required this.email, required this.phone});
  final String email;
  final String phone;

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  String _selectedItem = 'Tab';

  void _onItemTapped(String item) {
    setState(() {
      _selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tabs Demo')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey),
              child: Text(
                'Handling',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            titleConst("Handling"),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Tab'),
              onTap: () {
                _onItemTapped('Tab');
              },
            ),
            titleConst("Input Widget"),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('DropdownButton'),
              onTap: () {
                _onItemTapped('DropdownButton');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('RadioButton'),
              onTap: () {
                _onItemTapped('RadioButton');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Checkbox'),
              onTap: () {
                _onItemTapped('Checkbox');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Switch'),
              onTap: () {
                _onItemTapped('Switch');
              },
            ),
          ],
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (_selectedItem) {
      case 'Tab':
        return TabBarScreen(email: widget.email, phone: widget.phone);
      case 'DropdownButton':
        return DropdownScreen();
      case 'RadioButton':
        return RadiobuttonScreen();
      case 'Checkbox':
        return CheckboxScreen();
      case 'Switch':
        return Column();

      case 'Logout':
        return Center(
          child: Text('Logout Screen', style: TextStyle(fontSize: 24)),
        );
      default:
        return Center(
          child: Text('Profile Screen', style: TextStyle(fontSize: 24)),
        );
    }
  }
}
