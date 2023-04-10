import 'package:flutter/material.dart';

class ProjectModel {
  String name;
  // List<PartModel> parts =[];
  ProjectModel({required this.name});
}

class PartModel {
  String name;
  String pattern;

  PartModel({required this.name, required this.pattern});
}