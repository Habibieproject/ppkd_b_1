import 'package:flutter/material.dart';
import 'package:ppkd_b_1/controller/counter_provider.dart';
import 'package:ppkd_b_1/data/map_name.dart';
import 'package:ppkd_b_1/data/model_name.dart';
import 'package:ppkd_b_1/views/main/school/widgets/list_widget.dart';
import 'package:ppkd_b_1/views/main/school/widgets/list_with_model.dart';
import 'package:ppkd_b_1/views/main/school/widgets/map_widget.dart';
import 'package:ppkd_b_1/views/main/stack/profile_screen.dart';
import 'package:provider/provider.dart';

class SchoolScreen extends StatefulWidget {
  const SchoolScreen({super.key});

  @override
  State<SchoolScreen> createState() => _SchoolScreenState();
}

class _SchoolScreenState extends State<SchoolScreen> {
  String _selectedItem = 'List';

  void _onItemTapped(String item) {
    setState(() {
      _selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('${counterProvider.counter}')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey),
              child: Text(
                'ListView',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            titleConst("ListView"),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('List'),
              onTap: () {
                _onItemTapped('List');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Map'),
              onTap: () {
                _onItemTapped('Map');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Model'),
              onTap: () {
                _onItemTapped('Model');
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
      case 'List':
        return ListWidget();
      case 'Map':
        return ListMapWidget();
      case 'Model':
        return ListWithModel();
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
