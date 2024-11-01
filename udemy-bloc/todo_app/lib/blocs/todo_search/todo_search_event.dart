part of 'todo_search_bloc.dart';

sealed class TodoSearchEvent extends Equatable {
  const TodoSearchEvent();

  @override
  List<Object> get props => [];
}

class setSearchTermEvent extends TodoSearchEvent {
  final String newSearchTerm;
  setSearchTermEvent({
    required this.newSearchTerm,
  });

  @override
  List<Object> get props => [newSearchTerm];

  @override
  String toString() => 'setSearchTermEvent(newSearchTerm: $newSearchTerm)';
}
