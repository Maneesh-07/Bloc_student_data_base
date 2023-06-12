// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState {
  final List<StudentModel> modelList;
  HomeState({
    required this.modelList,
  });
}

class HomeIntial extends HomeState {
  HomeIntial({required super.modelList});

}
