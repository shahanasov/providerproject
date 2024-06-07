import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:register17/bd/model.dart';

class StudentProvider with ChangeNotifier{

  addStudent(StudentModel value)async{
    final studentDb = await Hive.openBox<StudentModel>('studentDb');
    await studentDb.add(value);
    var data =studentDb.values.toList();
    await studentDb.clear();
    await studentDb.addAll(data);
  }
  List<StudentModel> studentList=[];

  getAllDetails()async{
    final studentDb= await Hive.openBox<StudentModel>('studentDb');
    studentList.addAll(studentDb.values);
    notifyListeners();
  }
  
}