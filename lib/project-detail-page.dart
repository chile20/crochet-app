import 'package:flutter/material.dart';
import 'package:crochet_app/part-detail-page.dart';
import 'package:crochet_app/add-new-part.dart';
import 'package:crochet_app/main.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProjectDetailPage extends StatefulWidget {
  final String projectName;
  final List<String> pattern;
  final List<int> totalStitch;
  final int currentStitch;
  final int currentRow;
  final int totalRow;

  const ProjectDetailPage({
    required this.projectName,
    required this.pattern,
    required this.totalStitch,
    required this.currentStitch,
    required this.currentRow,
    required this.totalRow,
  });

  @override
  _ProjectDetailPageState createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  final List<String> _names = ['Part A', 'Part B', 'Part C'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.projectName),
            actions: <Widget>[
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
        body: Column(children: [
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
                      Text("Total: 30", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Spacer(),
                  const Text(
                    '23',
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
                      Text("Total: 30", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Spacer(),
                  const Text(
                    '23',
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
                      Text("Pattern",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 16),
                      Text("R2: *Inc*, rep 6 times. (12 sts)",
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
        bottomNavigationBar: Container(
          height: 56,
          margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.green,
                  child: Icon(Icons.add),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.redAccent,
                  child: Icon(Icons.remove),
                ),
              ),
            ],
          ),
        ));
  }
}