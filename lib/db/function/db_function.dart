import 'package:Bloc_student_data_base/bloc/home/bloc/home_bloc.dart';
import 'package:Bloc_student_data_base/model/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

List<StudentModel> studentListNotifier = [];

addStudent(StudentModel value, BuildContext context) {
  final studentDB = Hive.box<StudentModel>('Student_db');
  BlocProvider.of<HomeBloc>(context).add(AddStudent(value: value));
  // final _id = await studentDB.add(value);
  // value.id = _id;
  // studentListNotifier.add(value);
  studentDB.add(value);
}

getStudents() {
  final studentDB = Hive.box<StudentModel>('Student_db');
  studentListNotifier.clear();

  studentListNotifier.addAll(studentDB.values);
}

deleteStudent(int id, BuildContext context) async {
  final studentDB = await Hive.box<StudentModel>('Student_db');
  BlocProvider.of<HomeBloc>(context).add(DeleteStudent(index: id));
  await studentDB.deleteAt(id);
  getStudents();
}
