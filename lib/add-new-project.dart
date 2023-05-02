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
  List<String> patternArray = [];
  int key = 0;

  List<String> patternToArray(String text) {
    LineSplitter ls = new LineSplitter();
    return ls.convert(text);
  }

  List<int> totalStitchToArray(List<String> pattern) {
    List<int> result = [];
    RegExp regex = RegExp(r'\((\d+)\)');
    for (String str in pattern) {
      Match? match = regex.firstMatch(str);
      if (match != null) {
        String numStr = match.group(1)!;
        int num = int.parse(numStr);
        result.add(num);
      }
    }
    return result;
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
                                              hintText: 'Enter pattern',
                                              labelText: 'Patterns',
                                            ),
                                          ),
                                          Text("Note: Pattern input has to be standard crochet pattern with total of stitch for each row. \nExample: \nR1: 12 sc in Magic Ring. Sl st to first sc.(12 sts) \nR2: Chain 1, sc in same st. (12 sts)\n \""
                                          ),
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
                  patternArray = patternToArray(_projectPattern.text);
                  key = DateTime.now().millisecondsSinceEpoch;
                  print(key);
                  print(key.toString());
                  await box!.put(
                      key.toString(),
                      ProjectModel(
                        id: key,
                        name: _projectName.text,
                        pattern: patternArray,
                        currentRow: 1,
                        totalRow: patternArray.length,
                        currentStitch: 0,
                        totalStitch: totalStitchToArray(patternArray),
                        i: 0,
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
