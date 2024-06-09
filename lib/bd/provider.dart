

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:register17/bd/model.dart';

class StudentProvider with ChangeNotifier {
  addStudent(StudentModel value) async {
    final studentDb = await Hive.openBox<StudentModel>('studentDb');
    await studentDb.add(value);
    var data = studentDb.values.toList();
    await studentDb.clear();
    await studentDb.addAll(data);
    await getAllDetails();
  }

  List<StudentModel> studentList = [];

  getAllDetails() async {
    final studentDb = await Hive.openBox<StudentModel>('studentDb');
    studentList.clear();
    studentList.addAll(studentDb.values);
    notifyListeners();
  }

  Future<void> deleteStudent(int id) async {
    final studentDb = await Hive.openBox<StudentModel>('studentDb');
    await studentDb.delete(id);
    await getAllDetails();
  }

  Future updateStudent(StudentModel value,int key) async {
    final studentDb = await Hive.openBox<StudentModel>('studentDb');
    await studentDb.putAt(key, value);
    await getAllDetails();
  }
}
