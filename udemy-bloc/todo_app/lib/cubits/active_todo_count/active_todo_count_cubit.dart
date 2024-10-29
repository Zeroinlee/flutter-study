import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/cubits/todo_list/todo_list_cubit.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  late final StreamSubscription todoListSubcription;
  final TodoListCubit todoListCubit;
  ActiveTodoCountCubit({
    required this.todoListCubit,
  }) : super(ActiveTodoCountState.inital()) {
    todoListSubcription = todoListCubit.stream.listen(
      (todoListStatet) {
        print('todoListState: $TodoListState');

        final int currentActiveTodoCount = todoListStatet.todos
            .where((todo) => !todo.completed)
            .toList()
            .length;

        emit(state.copyWith(activeTodoCount: currentActiveTodoCount));
      },
    );
  }

  @override
  Future<void> close() {
    todoListSubcription.cancel();
    return super.close();
  }
}
