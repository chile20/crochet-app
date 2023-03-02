import 'package:flutter/material.dart';
import 'package:crochet_app/add-new-project.dart';
import 'package:crochet_app/project-detail-page.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({Key? key}) : super(key: key);

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
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
        title: Text("Project List"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemBuilder: (_, i) {
          String name = _names[i];
          bool isFavorite = favoriteProject.contains(name);
          return Column(
            children: <Widget>[
              ListTile(
                // leading: Icon(),
                title: Text('$name'),
                // <Add>
                trailing: IconButton(
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
                // </Add>
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProjectDetailPage()),
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