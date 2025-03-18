import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  //const Chats({Key? key}) : super(key: key);
  static const String id = 'contacts';

  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff075e54),
        title: const Text(
          'Select contact',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text(
              'New contact',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/nwc.png'),
            ),
            trailing: Icon(CupertinoIcons.qrcode),
          ),
          ListTile(
            title: Text(
              'New group',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/nwg.png'),
            ),
            //trailing: Icon(CupertinoIcons.qrcode),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Contacts on WhatsApp',
              style: TextStyle(color: Colors.blueGrey),
            ),
          ),
          ListTile(
            title: Text(
              '+91 9898980998 (You)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Message yourself'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/bat.jpg'),
            ),
            //trailing: Icon(CupertinoIcons.qrcode),
          ),
          ListTile(
            title: Text(
              'Andrew',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/andrew.jpg'),
            ),
            //trailing: Icon(CupertinoIcons.qrcode)
            subtitle: Text('At work'),
          ),
          ListTile(
            title: Text(
              'Anna Hathaway',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(backgroundImage: AssetImage('assets/ca.jpg')),
            subtitle: Text('Be kind'),
            //trailing: Icon(CupertinoIcons.qrcode),
          ),
          ListTile(
            title: Text(
              'Bastin Aldrin',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/seat.jpg'),
            ),
            //trailing: Icon(CupertinoIcons.qrcode),
          ),
          ListTile(
            title: Text(
              'Carl Nick',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/george.jpg'),
            ),
            //trailing: Icon(CupertinoIcons.qrcode),
            subtitle: Text('I can do all things through CHRIST...'),
          ),
          ListTile(
            title: Text('DAD', style: TextStyle(fontWeight: FontWeight.bold)),
            leading: CircleAvatar(backgroundImage: AssetImage('assets/ca.jpg')),
            //trailing: Icon(CupertinoIcons.qrcode),
            //subtitle: Text('Hey there! I am using WhatsApp.'),
          ),
          ListTile(
            title: Text(
              'Edward Sir',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/sam.jpg'),
            ),
            //trailing: Icon(CupertinoIcons.qrcode),
            subtitle: Text('Be Happy'),
          ),
          ListTile(
            title: Text('Lazar', style: TextStyle(fontWeight: FontWeight.bold)),
            leading: CircleAvatar(backgroundImage: AssetImage('assets/ca.jpg')),
            //trailing: Icon(CupertinoIcons.qrcode),
            //subtitle: Text('At work'),
          ),
          ListTile(
            title: Text('Lin', style: TextStyle(fontWeight: FontWeight.bold)),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/john.jpg'),
            ),
            //trailing: Icon(CupertinoIcons.qrcode),
            subtitle: Text('Available'),
          ),
          ListTile(
            title: Text('Nimmy', style: TextStyle(fontWeight: FontWeight.bold)),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/stacy.jpg'),
            ),
            //trailing: Icon(CupertinoIcons.qrcode),
            subtitle: Text('Busy'),
          ),
        ],
      ),
    );
  }
}
