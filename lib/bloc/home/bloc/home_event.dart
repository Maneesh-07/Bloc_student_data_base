part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class AddStudent extends HomeEvent {
  final StudentModel value;

  AddStudent({required this.value});
}

class DeleteStudent extends HomeEvent {
  final int index;

  DeleteStudent({required this.index});
}

class EditStudent extends HomeEvent {
  final int index;
  final StudentModel value;

  EditStudent({required this.index, required this.value});
}
