import 'dart:io';
import 'package:Bloc_student_data_base/bloc/search/bloc/search_bloc.dart';
import 'package:Bloc_student_data_base/home/profile.dart';
import 'package:Bloc_student_data_base/model/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/hive_flutter.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();

  List<StudentModel> studentList =
      Hive.box<StudentModel>('Student_db').values.toList();

  late List<StudentModel> studentDisplay = List<StudentModel>.from(studentList);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchBloc>(context)
        .add(OnSearch(studentDetail: studentList, value: ''));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              CupertinoSearchTextField(
                controller: _searchController,
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.black),
                onChanged: (value) => BlocProvider.of<SearchBloc>(context)
                    .add(OnSearch(studentDetail: studentList, value: value)),
              ),
              Expanded(child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  // if (studentList.isNotEmpty) {
                  //   const Center(
                  //     child: Text(
                  //       'No match found',
                  //       style: TextStyle(fontSize: 20),
                  //     ),
                  //   );
                  // }
                  return ListView.builder(
                    itemCount: state.searchList.length,
                    itemBuilder: (context, index) {
                      // final data = studentList[index];
                      File img = File(studentDisplay[index].image);
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: FileImage(img),
                          // studentDisplay[index].image.toString(),
                          radius: 22,
                        ),
                        title: Text(state.searchList[index].name),
                        // subtitle: Text(
                        //     '${studentDisplay[index]["age"].toString()} years old'),
                        onTap: (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StudentProfile(
                                passValue: state.searchList[index],
                                passId: index,
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }

//   Widget expanded() {
//     return Expanded(
//       child: studentDisplay.isNotEmpty
//           ? BlocBuilder<SearchBloc, SearchState>(
//               builder: (context, state) {
//                 return ListView.builder(
//                   itemCount: state.searchList.length,
//                   itemBuilder: (context, index) {
//                     // final data = studentList[index];
//                     File img = File(studentDisplay[index].image);
//                     return ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage: FileImage(img),
//                         // studentDisplay[index].image.toString(),
//                         radius: 22,
//                       ),
//                       title: Text(studentDisplay[index].name),
//                       // subtitle: Text(
//                       //     '${studentDisplay[index]["age"].toString()} years old'),
//                       onTap: (() {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => StudentProfile(
//                               passValue: studentDisplay[index],
//                               passId: index,
//                             ),
//                           ),
//                         );
//                       }),
//                     );
//                   },
//                 );
//               },
//             )
//           : const Center(
//               child: Text(
//                 'No match found',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//     );
//   }

//   Widget searchTextField(BuildContext context) {
//     return CupertinoSearchTextField(
//       controller: _searchController,
//       backgroundColor: Colors.grey.withOpacity(0.4),
//       prefixIcon: const Icon(
//         CupertinoIcons.search,
//         color: Colors.grey,
//       ),
//       suffixIcon: const Icon(
//         CupertinoIcons.xmark_circle_fill,
//         color: Colors.grey,
//       ),
//       style: const TextStyle(color: Colors.black),
//       onChanged: (value) => BlocProvider.of<SearchBloc>(context)
//           .add(OnSearch(studentDetail: studentDisplay, value: value)),
//     );
//   }

//   void _searchStudent(String value) {
//     // setState(() {
//     //   studentDisplay = studentList
//     //       .where((element) =>
//     //           element.name.toLowerCase().contains(value.toLowerCase()))
//     //       .toList();
//     // });
//   }

//   void clearText() {
//     _searchController.clear();
//   }

//   //builder-------------------------------------------------------------

//   @override
//   Widget build(BuildContext context) {
//     BlocProvider.of<SearchBloc>(context)
//         .add(OnSearch(studentDetail: studentDisplay, value: ''));
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             children: <Widget>[
//               searchTextField(context),
//               const SizedBox(
//                 height: 5,
//               ),
//               expanded(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
}
