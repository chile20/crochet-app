import 'package:crochet_app/project-list-page.dart';
import 'package:flutter/material.dart';
import 'package:crochet_app/main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:crochet_app/project_model.dart';

class ProjectDetailPage extends StatefulWidget {
  final int projectId;

  const ProjectDetailPage(this.projectId, {Key? key}) : super(key: key);

  @override
  _ProjectDetailPageState createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  @override
  late ProjectModel project;
  // String message = "";

  @override
  void initState() {
    super.initState();
    project = box!.get(widget.projectId.toString());
  }

  void decrease() {
    if (project.currentStitch != 0) {
      project.currentStitch--;
    } else {
      if (project.currentRow > 1) {
        project.currentRow--;
        project.currentStitch = 0;
        project.i--;
      } else {
        _showDialog(context, "You are at the start of the pattern. \nYou cannot decrease!");
      }
    }
    box!.put(project.id.toString(), project);
  }

  void increase() {
    if (project.currentStitch < project.totalStitch[project.i]) {
      project.currentStitch++;
    }
    if (project.currentStitch == project.totalStitch[project.i]) {
      if (project.currentRow < project.totalRow) {
        project.currentRow++;
        project.currentStitch = 0;
        project.i++;
      } else {
        print("Completed");
        _showDialog(context, "You have finished this pattern!");
      }
    }
    box!.put(project.id.toString(), project);
  }

  void _showDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProjectListPage()),
                );              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(project.name), actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.more_vert,
                  size: 26.0,
                ),
              )),
        ]),
        body: ValueListenableBuilder<Box<ProjectModel>>(
          valueListenable: Hive.box<ProjectModel>('projects').listenable(),
          builder: (context, box, _) {
            final project = box.get(widget.projectId.toString());
            return Column(children: [
              Card(
                margin: EdgeInsets.all(12),
                elevation: 4,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("Current Row",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                        ],
                      ),
                      Spacer(),
                      Text(
                        project!.currentRow.toString() +
                            " / " +
                            project!.totalRow.toString(),
                        style: TextStyle(
                          fontSize: 56,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(12),
                elevation: 4,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("Current Stitch",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          // Text("Total Stitch for Row " + project.currentRow.toString() + ": "+project.totalStitch[project.i].toString(), style: TextStyle(color: Colors.black)),
                        ],
                      ),
                      Spacer(),
                      Text(
                        project.currentStitch.toString() +
                            " / " +
                            project.totalStitch[project.i].toString(),
                        style: TextStyle(
                          fontSize: 56,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(12),
                elevation: 4,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                              "Pattern For Row " +
                                  project.currentRow.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 16),
                          Text(project.pattern[project.i],
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: Text(
                  "Note: \n"
                  "Click on the + button to increase the current stitch by one. \n"
                  "Click on the - button to decrease the current stitch by one.\n"
                  "Row and Pattern are automatically updated.",
                ),
              ),
            ]);
          },
        ),
        bottomNavigationBar: Container(
          height: 56,
          margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    increase();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.green,
                    child: Icon(Icons.add),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    decrease();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.redAccent,
                    child: Icon(Icons.remove),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
