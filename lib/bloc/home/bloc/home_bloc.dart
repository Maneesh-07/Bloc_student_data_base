import 'package:Bloc_student_data_base/db/function/db_function.dart';
import 'package:Bloc_student_data_base/model/data.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeIntial(modelList: studentListNotifier)) {
    on<AddStudent>((event, emit) {
      studentListNotifier.add(event.value);
      return emit(HomeState(modelList: studentListNotifier));
    });

    on<DeleteStudent>((event, emit) {
      studentListNotifier.removeAt(event.index);
      return emit(HomeState(modelList: studentListNotifier));
    });

    on<EditStudent>((event, emit) {
      studentListNotifier.removeAt(event.index);
      studentListNotifier.insert(event.index, event.value);
    });
  }
}
