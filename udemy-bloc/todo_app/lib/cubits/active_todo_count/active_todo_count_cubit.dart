import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/cubits/todo_list/todo_list_cubit.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  late final StreamSubscription todoListSubcription;

  final int initialActiveTodoCount;
  final TodoListCubit todoListCubit;

  ActiveTodoCountCubit({
    required this.initialActiveTodoCount,
    required this.todoListCubit,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount)) {
    todoListSubcription = todoListCubit.stream.listen(
      (todoListState) {
        print('todoListState: $todoListState');

        final int currentActiveTodoCount = todoListState.todos
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
