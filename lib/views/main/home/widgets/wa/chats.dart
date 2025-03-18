import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  //const Chats({Key? key}) : super(key: key);
  static const String id = 'chats';

  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff075e54),
        title: const Text(
          'WhatsApp',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 28),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, size: 28),
          ),
        ],
        bottom: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff075e54),
          leading: Container(
            child: Icon(
              Icons.camera_alt_rounded,
              color: Colors.white.withOpacity(0.5),
              size: 28,
            ),
          ),
          actions: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white, width: 3),
                ),
              ),
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Center(
                    child: Text(
                      'CHATS',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 115,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'STATUS',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 115,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'CALLS',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Color(0xff25D366),
            child: Icon(Icons.message),
          ),
        ),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text(
              'Archived',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            //subtitle: Text('hi bruh'),
            leading: Icon(CupertinoIcons.archivebox),
            trailing: Text('7'),
          ),
          ListTile(
            title: Text(
              'FLUTTER Batch23',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('+91 90807 69068 added  +91 47689...'),
            leading: CircleAvatar(backgroundImage: AssetImage('assets/sj.png')),
            trailing: Text('6:27 PM'),
          ),
          ListTile(
            title: Text('Ben', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Hi bruh'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/ben.jpg'),
            ),
            trailing: Text('6:13 PM'),
          ),
          ListTile(
            title: Text(
              'Betty Manager',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Mail it when its done'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/betty.jpg'),
            ),
            trailing: Text('5:56 PM'),
          ),
          ListTile(
            title: Text('Mom', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Had coffee???'),
            leading: CircleAvatar(backgroundImage: AssetImage('assets/ca.jpg')),
            trailing: Text('5:35 PM'),
          ),
          ListTile(
            title: Text(
              'Johny Bro',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Wb the meeting?'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/john.jpg'),
            ),
            trailing: Text('10:07 AM'),
          ),
          ListTile(
            title: Text(
              'Flutter Devs',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Johny: Good mrng guys!'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/flu.jpg'),
            ),
            trailing: Text('9:11 AM'),
          ),
          ListTile(
            title: Text(
              'Sam Bombay',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Meeting with BOSS tomorrow!'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/sam.jpg'),
            ),
            trailing: Text('Yesterday'),
          ),
          ListTile(
            title: Text('Stacy', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Call me asap'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/stacy.jpg'),
            ),
            trailing: Text('Tuesday'),
          ),
          ListTile(
            title: Text(
              'Andrew',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Okay its fine'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/andrew.jpg'),
            ),
            trailing: Text('Tuesday'),
          ),
          ListTile(
            title: Text('Sara', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Hmmm'),
            leading: CircleAvatar(backgroundImage: AssetImage('assets/ca.jpg')),
            trailing: Text('Monday'),
          ),
        ],
      ),
    );
  }
}
