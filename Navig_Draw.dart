

import 'package:flutter/material.dart';

import 'main.dart';
// import 'package:my_projekt/admin_code.dart';
// import 'package:my_projekt/insert.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key});

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  int index = 0;
  
  get addServer => null;

  // final list = const [inserts(), admin()];

  void updateScreenText(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }
  @override
   Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Navigation Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle home tap
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              // Handle profile tap
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Handle settings tap
            },
          ),

          
           ListTile(
            leading: Icon(Icons.settings),
            title: Text('Add server'),
               onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddServerPage(
                  onServerAdded: addServer,
                ),
              ),
            );
                    },
          ),

           ListTile(
            leading: Icon(Icons.settings),
            title: Text('Insert'),
            onTap: () {


              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => inserts(),
              //   ),
              // );
              // Handle settings tap
            },
          ),


          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Admin'),
            onTap: () {

// Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => AdminScreen(),
//                 ),
//               );
              // Handle settings tap
            },
          ),

        ],
      ),
    );
  }

}









