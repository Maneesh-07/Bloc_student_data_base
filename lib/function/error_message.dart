
import 'package:Bloc_student_data_base/function/error_check.dart';
import 'package:Bloc_student_data_base/function/student_add.dart';
import 'package:flutter/material.dart';

SnackBar CheckError(List data, BuildContext context) {
  
  String field = ErrorCheck(data);

  if (field != "success") {
    SnackBar mysnackbar = SnackBar(
      content: Row(
        children: [const Icon(Icons.error), Text("$field is empty")],
      ),
      backgroundColor: Colors.red,
    );
    return mysnackbar;
  } else {
    studentAdder(data, context);
    SnackBar mysnackbar = SnackBar(
        content: Row(
      children:const [Icon(Icons.done), Text("Successfullty added"),
      
      ],
      
            
    ));
    return mysnackbar;
  }
}
