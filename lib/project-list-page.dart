import 'package:flutter/material.dart';
import 'package:crochet_app/add-new-project.dart';
import 'package:crochet_app/project-detail-page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:crochet_app/data/database.dart';
import 'package:crochet_app/project_model.dart';
import 'package:crochet_app/main.dart';

// import 'package:http/http.dart' as http;
// import 'dart:convert';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({Key? key}) : super(key: key);

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  TextEditingController _projectName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project List"),
        automaticallyImplyLeading: false,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<ProjectModel>('projectBox').listenable(),
        builder: (context, Box<ProjectModel> box, _) {
          if (box.values.isEmpty) {
            return const Center(child: Text("No Projects"));
          } else {
            return ListView.separated(
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                var result = box.getAt(index);
                return Card(
                    child: ListTile(
                  title: Text(result!.name),
                  // <Add>
                  trailing: PopupMenuButton(
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: 'delete',
                          child: Text('Delete'),
                          onTap: () {
                            box.deleteAt(index);
                          },
                        )
                      ];
                    },
                  ),
                  // </Add>
                ));
              },
              separatorBuilder: (context, i) {
                return const SizedBox(height: 12);
              },
            );
            // return Column(
            //   children: <Widget>[
            //     ListTile(
            //       // leading: Icon(),
            //       title: Text("Title"),
            //       // <Add>
            //       trailing: PopupMenuButton(
            //         itemBuilder: (context) {
            //           return [
            //             PopupMenuItem(
            //               value: 'edit',
            //               child: Text('Edit Name'),
            //             ),
            //             PopupMenuItem(
            //               value: 'delete',
            //               child: Text('Delete'),
            //             )
            //           ];
            //         },
            //         onSelected: (String value) {
            //           print('You Click on po up menu item');
            //         },
            //       ),
            //       // </Add>
            //       onTap: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => ProjectDetailPage()),
            //         );
            //       },
            //     ),
            //     Divider(),
            //   ],
            // );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => addNewProject(context),
        label: const Text('New Project'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  addNewProject(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("New Project"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _projectName,
                  decoration: const InputDecoration(hintText: 'Name'),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await box!.put(
                          DateTime.now().toString(),
                          ProjectModel(
                            name: _projectName.text,
                            id: DateTime.now().millisecondsSinceEpoch,
                          ));
                      Navigator.pop(context);
                    },
                    child: const Text("Add")),
              ],
            ),
          );
        });
  }
}
