import 'package:crochet_app/project_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProjectDataBase {
  List<ProjectModel> projects=[
    ProjectModel(name: "Project one"),
    ProjectModel(name: "Project 2"),
    ProjectModel(name: "Project 3"),
    ProjectModel(name: "Project 4"),
  ];
  // reference to box
  final _myBox = Hive.box('mybox');

  // load data from database
  void loadData() {
    projects = _myBox.get("PROJECTS");
  }

  // update database
  void updateDataBase() {
    _myBox.put("PROJECTS", projects);
  }
}