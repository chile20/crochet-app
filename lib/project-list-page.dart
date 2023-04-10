import 'package:crochet_app/data/database.dart';
import 'package:flutter/material.dart';
import 'package:crochet_app/add-new-project.dart';
import 'package:crochet_app/project-detail-page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:crochet_app/project_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({Key? key}) : super(key: key);

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  // reference to hive box
  final _myBox = Hive.openBox('mybox');
  ProjectDataBase db = ProjectDataBase();
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
        itemCount: db.projects.length,
        itemBuilder: (context, index) {
          // itemCount: projects.length;
          return Column(
            children: <Widget>[
              ListTile(
                // leading: Icon(),
                title: Text(db.projects[index].name),
                // <Add>
                trailing: PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: 'edit',
                        child: Text('Edit Name'),
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
                    MaterialPageRoute(builder: (context) => ProjectDetailPage()),
                  );
                },
              ),
              Divider(),
            ],
          );
        },
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