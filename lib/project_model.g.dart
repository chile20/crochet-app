// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectModelAdapter extends TypeAdapter<ProjectModel> {
  @override
  final int typeId = 0;

  @override
  ProjectModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProjectModel(
      id: fields[0] as int,
      name: fields[1] as String,
      pattern: (fields[2] as List).cast<String>(),
      currentRow: fields[3] as int,
      totalRow: fields[4] as int,
      currentStitch: fields[5] as int,
      totalStitch: (fields[6] as List).cast<int>(),
      i: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProjectModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.pattern)
      ..writeByte(3)
      ..write(obj.currentRow)
      ..writeByte(4)
      ..write(obj.totalRow)
      ..writeByte(5)
      ..write(obj.currentStitch)
      ..writeByte(6)
      ..write(obj.totalStitch)
      ..writeByte(7)
      ..write(obj.i);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
