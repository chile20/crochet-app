import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'project_model.g.dart';

@HiveType(typeId: 0)
class ProjectModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  // List<PartModel> parts =[];
  ProjectModel({required this.id, required this.name});
}