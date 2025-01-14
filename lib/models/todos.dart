// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Todos {
  String tasks;
  bool isDone;
  Timestamp createdOn;
  Timestamp updatedOn;

  Todos({
    required this.tasks,
    required this.isDone,
    required this.createdOn,
    required this.updatedOn,
  });

  Todos.fromJson(Map<String, Object?> json)
      : this(
            tasks: json['task']! as String,
            isDone: json['isDone']! as bool,
            createdOn: json['createdOn']! as Timestamp,
            updatedOn: json['updatedOn']! as Timestamp);

  Todos copyWith({
    String? tasks,
    bool? isDone,
    Timestamp? createdOn,
    Timestamp? updatedOn,
  }) {
    return Todos(
        tasks: tasks ?? this.tasks,
        isDone: isDone ?? this.isDone,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn);
  }

  Map<String, Object?> toJson() {
    return {
      'tasks': tasks,
      'isDone': isDone,
      'createdOn': createdOn,
      'updatedOn': updatedOn,
    };
  }
}
