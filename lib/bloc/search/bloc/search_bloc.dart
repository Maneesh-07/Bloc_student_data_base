import 'package:Bloc_student_data_base/db/function/db_function.dart';
import 'package:Bloc_student_data_base/model/data.dart';
import 'package:bloc/bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial(searchList: studentListNotifier)) {
    on<OnSearch>((event, emit) {
      emit(SearchState(
          searchList: event.studentDetail
              .where((element) => element.name
                  .toLowerCase()
                  .contains(event.value.toLowerCase()))
              .toList()));
    });
  }
}
