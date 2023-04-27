import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:crochet_app/project_model.dart';
import 'package:crochet_app/main.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddNewProject extends StatefulWidget {
  const AddNewProject({Key? key}) : super(key: key);

  @override
  State<AddNewProject> createState() => _AddNewProjectState();
}

class _AddNewProjectState extends State<AddNewProject> {
  TextEditingController _projectName = TextEditingController();
  TextEditingController _projectPattern = TextEditingController();

  List<String> patternToArray(String text) {
    LineSplitter ls = new LineSplitter();
    return ls.convert(text);
  }

  List<int> totalStitchToArray(List<String> pattern) {
    return [0, 1, 2];
  }

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
                                        ...[
                                          TextFormField(
                                            controller: _projectName,
                                            decoration: const InputDecoration(
                                              border: UnderlineInputBorder(),
                                              filled: true,
                                              hintText: 'Enter project name',
                                              labelText: 'Project Name',
                                            ),
                                          ),
                                          TextFormField(
                                            controller: _projectPattern,
                                            maxLines: null,
                                            decoration: const InputDecoration(
                                              border: UnderlineInputBorder(),
                                              filled: true,
                                              hintText: 'Enter notes',
                                              labelText: 'Notes',
                                            ),
                                          ),
                                          // Row(
                                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //   crossAxisAlignment: CrossAxisAlignment.center,
                                          //   children: [
                                          //     Text('Enable feature',
                                          //         style: Theme.of(context).textTheme.bodyLarge),
                                          //     Switch(
                                          //       value: enableFeature,
                                          //       onChanged: (enabled) {
                                          //         setState(() {
                                          //           enableFeature = enabled;
                                          //         });
                                          //       },
                                          //     ),
                                          //   ],
                                          // ),
                                        ].expand((widget) => [
                                              widget,
                                              const SizedBox(
                                                height: 24,
                                              )
                                            ])
                                      ]))))))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(16),
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await box!.put(
                      DateTime.now().toString(),
                      ProjectModel(
                        id: DateTime.now().millisecondsSinceEpoch,
                        name: _projectName.text,
                        pattern: patternToArray(_projectPattern.text),
                        currentRow: 0,
                        totalRow: 0,
                        currentStitch: 0,
                        totalStitch: [10, 20, 30, 40],
                      ));
                  Navigator.pop(context);
                },
                child: const Text('Add',
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
