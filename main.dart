import 'package:flut_pract/Navig_Draw.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ServerPage(),
    );
  }
}

class ServerPage extends StatefulWidget {
  @override
  _ServerPageState createState() => _ServerPageState();
}

class _ServerPageState extends State<ServerPage> {
  List<Server> servers = [
    Server(
      id: 1,
      name: 'Server 1',
      firstName: 'John',
      lastName: 'Doe',
      names: [], // Initialize an empty list of names
    ),
    Server(
      id: 2,
      name: 'Server 2',
      firstName: 'Jane',
      lastName: 'Smith',
      names: [], // Initialize an empty list of names
    ),
  ];

  void addServer(String name, String firstName, String lastName) {
    setState(() {
      int newId = servers.length + 1;
      Server newServer = Server(
        id: newId,
        name: 'Server $newId',
        firstName: firstName,
        lastName: lastName,
        names: [], // Initialize an empty list of names
      );
      servers.add(newServer);
    });
  }

  void openServerDetails(Server server) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServerDetailsPage(server: server),
      ),
    );
  }

  void openInsertPage(Server server) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InsertPage(server: server),
      ),
    );
  }

  void addName(Server server, String name) {
    setState(() {
      server.names.add(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Server Page'),
      ),
      drawer: NavbarWidget(),
      body: Center(
        child: Container(
          height: 900.0,
          width: 1500.0,
        
           decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color.fromARGB(255, 205, 223, 185), Colors.green],
              ),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 205, 223, 185),
                  blurRadius: 5.0,
                  offset: Offset(6, 10),
                ),
              ],
            ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 40.0, 
              mainAxisSpacing: 40.0,
              children: [
                for (Server server in servers)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
            onTap: () {
              openServerDetails(server);
            },
            child: Container(
              width: 150,
              height: 50,
               decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color.fromARGB(255, 205, 223, 185), Colors.green],
              ),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 205, 223, 185),
                  blurRadius: 5.0,
                  offset: Offset(6, 10),
                ),
              ],
            ),
              child: Center(
                child: Text(
                  server.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: GestureDetector(
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
                    child: Container(
            width: 150,
            height: 50,
                            
            

             decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color.fromARGB(255, 205, 223, 185), Colors.green],
              ),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 205, 223, 185),
                  blurRadius: 5.0,
                  offset: Offset(6, 10),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'Add Server',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
                    ),
                  ),
                ),
                for (Server server in servers)
                  if (server.names.isNotEmpty)
                    Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: GestureDetector(
              onTap: () {
                openInsertPage(server);
              },
              // child: Container(
              //   width: 150,
              //   height: 50,
                               
            
              //   color: const Color.fromARGB(255, 29, 32, 29),
              //   child: Center(
              //     child: Text(
              //       'Insert',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 18,
              //       ),
              //     ),
              //   ),
              // ),
            ),
                    ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      )
    );
  }
}














class AddServerPage extends StatefulWidget {
  final Function(String, String, String) onServerAdded;

  AddServerPage({required this.onServerAdded});

  @override
  _AddServerPageState createState() => _AddServerPageState();
}

class _AddServerPageState extends State<AddServerPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  bool showError = false;

  @override
  void dispose() {
    nameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  void addServerButton() {
    String name = nameController.text;
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    if (name.isNotEmpty && firstName.isNotEmpty && lastName.isNotEmpty) {
      widget.onServerAdded(name, firstName, lastName);
      Navigator.pop(context);
    } else {
      setState(() {
        showError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Server'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                color: Colors.blueAccent,
                width: 800.0,
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Server Name',
                      ),
                    ),
                    TextField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                      ),
                    ),
                    TextField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                      ),
                    ),
                    if (showError)
                      Text(
                        'Please enter all fields.',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: addServerButton,
                      child: Text('Add'),
                    ),
                  ],
                ),
              ),
        
            ),
            ////////////
             Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                color: Colors.blueAccent,
                width: 800.0,
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Server Name',
                      ),
                    ),
                    TextField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                      ),
                    ),
                    TextField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                      ),
                    ),
                    if (showError)
                      Text(
                        'Please enter all fields.',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                   
                  ],
                ),
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

class ServerDetailsPage extends StatefulWidget {
  final Server server;

  ServerDetailsPage({required this.server});

  @override
  _ServerDetailsPageState createState() => _ServerDetailsPageState();
}

class _ServerDetailsPageState extends State<ServerDetailsPage> {
  List<String> enteredNames = [];

  void openInsertPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InsertPage(server: widget.server),
      ),
    );

    if (result != null && result is List<String>) {
      setState(() {
        enteredNames = result;
      });
    }
  }

  void openHelloPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HelloPage(names: enteredNames),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Server Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Server Name: ${widget.server.name}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'First Name: ${widget.server.firstName}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Last Name: ${widget.server.lastName}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              openInsertPage(context);
            },
            child: Text('Insert'),
          ),
          SizedBox(height: 16),
          if (enteredNames.isNotEmpty)
            ElevatedButton(
              onPressed: () {
                openHelloPage(context);
              },
              child: Text('Hello'),
            ),
        ],
      ),
    );
  }
}




class Server {
  final int id;
  final String name;
  final String firstName;
  final String lastName;
  final List<String> names;

  Server({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.names,
  });
}

class InsertPage extends StatefulWidget {
  final Server server;


  InsertPage({required this.server});

  @override
  _InsertPageState createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  TextEditingController name1Controller = TextEditingController();
  TextEditingController name2Controller = TextEditingController();

  void createNewPage(BuildContext context) {
    final name1 = name1Controller.text;
    final name2 = name2Controller.text;

    if (name1.isNotEmpty && name2.isNotEmpty) {
      Navigator.pop(
        context,
        [name1, name2],
      );
    }
  }

   
      
  


  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: name1Controller,
            decoration: InputDecoration(
              labelText: 'Name 1',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: name2Controller,
            decoration: InputDecoration(
              labelText: 'Name 2',
            ),
          ),
           
              Text(
                'Please enter all fields.',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
          SizedBox(height: 16),
          
          ElevatedButton(
            onPressed: () {
              createNewPage(context);
            },
            child: Text('Go'),
          ),
        ],
      ),
    );
  }
}

class HelloPage extends StatelessWidget {
  final List<String> names;

  HelloPage({required this.names});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Name 1: ${names[0]}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Name 2: ${names[1]}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back'),
          ),
        ],
      ),
    );
  }
}
  






