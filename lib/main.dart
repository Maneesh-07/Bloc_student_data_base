import 'package:Bloc_student_data_base/bloc/add_image/bloc/add_image_bloc.dart';
import 'package:Bloc_student_data_base/bloc/home/bloc/home_bloc.dart';
import 'package:Bloc_student_data_base/bloc/image/image_bloc.dart';
import 'package:Bloc_student_data_base/bloc/search/bloc/search_bloc.dart';
import 'package:Bloc_student_data_base/home/homescreen.dart';
import 'package:Bloc_student_data_base/model/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  await Hive.openBox<StudentModel>('Student_db');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => ImageBloc(),
        ),
        BlocProvider(
          create: (context) => AddImageBloc(),
        ),
        BlocProvider(
          create: (context) => SearchBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Ubuntu',
          primarySwatch: Colors.blueGrey,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
