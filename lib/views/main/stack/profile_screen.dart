import 'package:flutter/material.dart';
import 'package:ppkd_b_1/data/grid_data.dart';
import 'package:ppkd_b_1/views/main/stack/widgets/input/textfield.dart';
import 'package:ppkd_b_1/views/main/stack/widgets/layouting/expanded.dart';
import 'package:ppkd_b_1/views/main/stack/widgets/layouting/gridview.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _selectedItem = 'Grid';

  void _onItemTapped(String item) {
    setState(() {
      _selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Profile'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey),
              child: Text(
                'Layouting',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            titleConst("Layouting"),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Expanded'),
              onTap: () {
                _onItemTapped('Expanded');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Grid'),
              onTap: () {
                _onItemTapped('Grid');
              },
            ),
            titleConst("Input"),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('TextField'),
              onTap: () {
                _onItemTapped('TextField');
              },
            ),
            titleConst("Event"),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Button'),
              onTap: () {
                _onItemTapped('Button');
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
      case 'Expanded':
        return ExpandedScreen();
      case 'Grid':
        return GridviewScreen();
      case 'TextField':
        return TextFieldScreen();
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

Text titleConst(String text) => Text(text, style: TextStyle(fontSize: 24));
