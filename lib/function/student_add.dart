import 'package:Bloc_student_data_base/db/function/db_function.dart';
import 'package:Bloc_student_data_base/model/data.dart';
import 'package:Bloc_student_data_base/screens/widgets/addstudent.dart';
import 'package:flutter/material.dart';

studentAdder(List data, BuildContext context) {
  final student = StudentModel(
      name: data[0],
      age: data[1],
      number: data[2],
      division: data[3],
      image: data[4]);
  addStudent(student, context);
  findClear();
}

findClear() {
  nameController.clear();
  ageController.clear();
  numController.clear();
  divController.clear();
}
