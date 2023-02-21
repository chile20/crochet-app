import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Projects',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'My Projects'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _names = ['Project 1', 'Project 2', 'Project 3'];
  Set<String> favoriteProject = Set<String>();
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (_, i) {
          String name = _names[i];
          bool isFavorite = favoriteProject.contains(name);
          return Column(
            children: <Widget>[
              ListTile(
                leading: IconButton(
              icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : null,
          ),
                  onPressed: ()
                  {
                    setState(() {
                      if(isFavorite)
                        favoriteProject.remove(name);
                      else
                        favoriteProject.add(name);
                    });
                  },
          ),
                title: Text('$name'),
                // <Add>
                trailing: PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: 'edit',
                        child: Text('Edit'),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      )
                    ];
                  },
                  onSelected: (String value) {
                    print('You Click on po up menu item');
                  },
                ),
                // </Add>
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Project1()),
                  );
                },
              ),
              Divider(),
            ],
          );
        },
        itemCount: _names.length,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNewProject()),
          );
        },
        label: const Text('New Project'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class AddNewProject extends StatelessWidget {
  const AddNewProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Project'),
      ),
      body: Stack(
        children: [
          Form(
              child: Scrollbar(
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Card(
                          child: SingleChildScrollView(
                              padding: const EdgeInsets.all(16),
                              child: ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 400),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        TextFormField(
                                          decoration: const InputDecoration(
                                            border: UnderlineInputBorder(),
                                            filled: true,
                                            hintText: 'Enter project name',
                                            labelText: 'Project Name',
                                          ),
                                        ),
                                        TextFormField(
                                          decoration: const InputDecoration(
                                            border: UnderlineInputBorder(),
                                            filled: true,
                                            hintText: 'Enter project link',
                                            labelText: 'Project Link',
                                          ),
                                        ),
                                        TextFormField(
                                          maxLines: null,
                                          decoration: const InputDecoration(
                                            border: UnderlineInputBorder(),
                                            filled: true,
                                            hintText: 'Enter notes',
                                            labelText: 'Notes',
                                          ),
                                        ),
                                      ]))))))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(16),
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Save',
                    style: TextStyle(
                      fontSize: 18,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Project1 extends StatelessWidget {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project 1'),
      ),
      body: Stack(
        children: [
          Card(
              child: Scrollbar(
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Card(
                          child: SingleChildScrollView(
                              padding: const EdgeInsets.all(16),
                              child: ConstrainedBox(
                                  constraints:
                                  const BoxConstraints(maxWidth: 400),
                                  child: Column(
                                      // mainAxisAlignment:
                                      // MainAxisAlignment.center,
                                      // crossAxisAlignment:
                                      // CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Counter 1',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                Icons.remove,
                                                color: Theme.of(context).accentColor,
                                              ),
                                              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
                                              iconSize: 32.0,
                                              color: Theme.of(context).primaryColor,
                                              onPressed: () {
                                                counter--;
                                              },
                                            ),
                                            Text(
                                              '$counter',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.add,
                                                color: Theme.of(context).accentColor,
                                              ),
                                              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
                                              iconSize: 32.0,
                                              color: Theme.of(context).primaryColor,
                                              onPressed: () {
                                                counter++;
                                              },
                                            ),
                                          ],
                                        ),
                                      ]
                                  )
                              )
                          )
                      )
                  )
              )
          ),
        ],
      )
    );
  }
}
