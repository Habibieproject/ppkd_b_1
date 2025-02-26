import 'package:flutter/material.dart';
import 'package:ppkd_b_1/data/grid_data.dart';
import 'package:ppkd_b_1/views/main/stack/widgets/expanded.dart';
import 'package:ppkd_b_1/views/main/stack/widgets/gridview.dart';

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
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                'Layouting',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
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
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                _onItemTapped('Settings');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                _onItemTapped('Logout');
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
      case 'Settings':
        return Center(child: Text('Settings Screen', style: TextStyle(fontSize: 24)));
      case 'Logout':
        return Center(child: Text('Logout Screen', style: TextStyle(fontSize: 24)));
      default:
        return Center(child: Text('Profile Screen', style: TextStyle(fontSize: 24)));
    }
  }
}
