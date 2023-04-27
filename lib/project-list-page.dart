import 'package:flutter/material.dart';
import 'package:crochet_app/add-new-project.dart';
import 'package:crochet_app/project-detail-page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:crochet_app/data/database.dart';
import 'package:crochet_app/project_model.dart';
import 'package:crochet_app/main.dart';
import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'dart:convert';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({Key? key}) : super(key: key);

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  TextEditingController _projectName = TextEditingController();
  TextEditingController _projectPattern = TextEditingController();
  List<String> patternList = [];

  void patternToArray(String text) {
    LineSplitter ls = new LineSplitter();
    patternList = ls.convert(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project List"),
        automaticallyImplyLeading: false,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<ProjectModel>('project').listenable(),
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProjectDetailPage(
                            projectName: result!.name,
                            pattern: result!.pattern,
                            currentRow: result!.currentRow,
                            totalRow: result!.totalRow,
                            totalStitch: result!.totalStitch,
                            currentStitch: result!.currentStitch,
                          )),
                    );
                  },
                  // </Add>
                ));
              },
              separatorBuilder: (context, i) {
                return const SizedBox(height: 12);
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        // onPressed: () => addNewProject(context),
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

  // addNewProject(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: const Text("New Project"),
  //           content: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               TextFormField(
  //                 controller: _projectName,
  //                 decoration: const InputDecoration(hintText: 'Name'),
  //               ),
  //               const SizedBox(
  //                 height: 15,
  //               ),
  //               TextFormField(
  //                 controller: _projectPattern,
  //                 decoration: const InputDecoration(hintText: 'Pattern'),
  //               ),
  //               const SizedBox(
  //                 height: 15,
  //               ),
  //               ElevatedButton(
  //                   onPressed: () async {
  //                     patternToArray(_projectPattern.text);
  //                     patternList.forEach((element) => print(element));
  //                     await box!.put(
  //                         DateTime.now().toString(),
  //                         ProjectModel(
  //                           name: _projectName.text,
  //                           pattern: _projectPattern.text,
  //                           id: DateTime.now().millisecondsSinceEpoch,
  //                         ));
  //                     Navigator.pop(context);
  //                   },
  //                   child: const Text("Add")),
  //             ],
  //           ),
  //         );
  //       });
  // }
}
