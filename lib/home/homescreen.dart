
import 'package:Bloc_student_data_base/db/function/db_function.dart';
import 'package:Bloc_student_data_base/home/search.dart';
import 'package:Bloc_student_data_base/screens/widgets/addstudent.dart';
import 'package:Bloc_student_data_base/screens/widgets/studentlist.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getStudents();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Student Data'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => SearchScreen())));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: const Column(
        children:  [
          Expanded(
            child: ListStudent(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddStudent()));
          // AddStudent();
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Details'),
      ),
    );
  }
}
