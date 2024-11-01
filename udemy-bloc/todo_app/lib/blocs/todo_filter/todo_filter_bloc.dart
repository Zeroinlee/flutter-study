import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';

part 'todo_filter_event.dart';
part 'todo_filter_state.dart';

class TodoFilterBloc extends Bloc<TodoFilterEvent, TodoFilterState> {
  TodoFilterBloc() : super(const TodoFilterInitial()) {
    on<ChangeFilterEvent>((event, emit) {
      emit(TodoFilterSelected(selectedFilter: event.newFilter));
    });
  }
}
