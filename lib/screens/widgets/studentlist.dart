import 'dart:io';

import 'package:Bloc_student_data_base/bloc/home/bloc/home_bloc.dart';
import 'package:Bloc_student_data_base/db/function/db_function.dart';
import 'package:Bloc_student_data_base/home/profile.dart';
import 'package:Bloc_student_data_base/screens/widgets/editprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListStudent extends StatelessWidget {
  const ListStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getStudents();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: ((context, index) {
              final data = state.modelList[index];
              return Container(
                color: const Color.fromARGB(255, 218, 239, 239),
                child: ListTile(
                    contentPadding: const EdgeInsets.all(10.0),
                    leading: CircleAvatar(
                      backgroundImage: FileImage(File(data.image)),
                      radius: 30,
                    ),
                    title: Text(data.name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile(
                                          passValueProfile: data,
                                          index: index,
                                        )));
                          },
                          icon: const Icon(Icons.edit),
                          color: Colors.green.shade400,
                        ),
                        IconButton(
                          onPressed: () {
                            deleteAlert(context, index);
                            // deleteStudent(index);
                          },
                          icon: const Icon(Icons.delete_outlined),
                          color: Colors.red,
                        ),
                      ],
                    ),
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentProfile(
                                    passValue: data,
                                    passId: index,
                                  )));
                    })),
              );
            }),
            separatorBuilder: (context, index) {
              return const Divider(
                height: 3,
              );
            },
            itemCount: state.modelList.length);
      },
    );
  }
}

deleteAlert(BuildContext context, index) {
  showDialog(
      context: context,
      builder: ((ctx) => AlertDialog(
            content: const Text('Are you sure you want to delete'),
            actions: [
              TextButton(
                  onPressed: () {
                    deleteStudent(index, context);
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                onPressed: () => Navigator.of(context).pop(ctx),
                child: const Text('Cancel'),
              )
            ],
          )));
}
