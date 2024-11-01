part of 'todo_filter_bloc.dart';

// final class TodoFilterState extends Equatable {
//   final Filter filter;
//   const TodoFilterState({
//     required this.filter,
//   });

//   factory TodoFilterState.initial() {
//     return const TodoFilterState(filter: Filter.all);
//   }

//   @override
//   List<Object> get props => [filter];

//   @override
//   String toString() => 'TodoFilterState(filter: $filter)';

//   TodoFilterState copyWith({
//     Filter? filter,
//   }) {
//     return TodoFilterState(
//       filter: filter ?? this.filter,
//     );
//   }
// }

sealed class TodoFilterState extends Equatable {
  final Filter filter;

  const TodoFilterState({required this.filter});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'TodoFilterState(filter: $filter)';
}

final class TodoFilterInitial extends TodoFilterState {
  const TodoFilterInitial() : super(filter: Filter.all);
}

final class TodoFilterSelected extends TodoFilterState {
  final Filter selectedFilter;
  const TodoFilterSelected({required this.selectedFilter})
      : super(filter: selectedFilter);
}
