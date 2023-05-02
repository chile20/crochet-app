import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'project_model.g.dart';

@HiveType(typeId: 0)
class ProjectModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  List<String> pattern;
  @HiveField(3)
  int currentRow;
  @HiveField(4)
  int totalRow;
  @HiveField(5)
  int currentStitch;
  @HiveField(6)
  List<int> totalStitch;
  @HiveField(7)
  int i;
  // List<PartModel> parts =[];
  ProjectModel({
    required this.id,
    required this.name,
    required this.pattern,
    required this.currentRow,
    required this.totalRow,
    required this.currentStitch,
    required this.totalStitch,
    required this.i,
  });
}