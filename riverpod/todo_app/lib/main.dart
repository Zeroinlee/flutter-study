import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
        ChangeNotifierProvider(create: (_) => FilterProvider()),
      ],
      child: const MaterialApp(
        home: TodoScreen(),
      ),
    );
  }
}

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do 리스트')),
      body: const Column(
        children: [
          CategoryFilter(),
          Expanded(child: TodoList()),
          AddTodoButton(),
        ],
      ),
    );
  }
}

class Todo {
  String id;
  String title;
  bool isCompleted;
  String category;

  Todo({
    required this.id,
    required this.title,
    this.isCompleted = false,
    required this.category,
  });
}

class TodoProvider with ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    // TODO: Implement the addTodo method
    _todos.add(todo);
    notifyListeners();
  }

  void updateTodo(String id, {String? title, bool? isCompleted}) {
    // TODO: Implement the updateTodo method
    final todo = _todos.firstWhere((todo) => todo.id == id);
    if (title != null) todo.title = title;
    if (isCompleted != null) todo.isCompleted = isCompleted;
    notifyListeners();
  }

  void deleteTodo(String id) {
    // TODO: Implement the deleteTodo method
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<FilterProvider>(context);

    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FilterButton(category: 'All'),
          FilterButton(category: 'Work'),
          FilterButton(category: 'Personal'),
        ],
      ),
    );
  }
}

class FilterProvider with ChangeNotifier {
  String _selectedCategory = 'All';

  String get selectedCategory => _selectedCategory;

  void setCategory(String category) {
    // TODO: Implement the setCategory method
    _selectedCategory = category;
    notifyListeners();
  }
}

class FilterButton extends StatelessWidget {
  final String category;

  const FilterButton({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterProvider>(context);

    return ElevatedButton(
      onPressed: () {
        // TODO: Set the category
        filterProvider.setCategory(category);
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          filterProvider.selectedCategory == category
              ? Colors.blue
              : Colors.grey,
        ),
      ),
      child: Text(category),
    );
  }
}

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final filterProvider = Provider.of<FilterProvider>(context);

    final filteredTodos = filterProvider.selectedCategory == 'All'
        ? todoProvider.todos
        : todoProvider.todos
            .where((todo) => todo.category == filterProvider.selectedCategory)
            .toList();

    return ListView.builder(
      itemCount: filteredTodos.length,
      itemBuilder: (context, index) {
        final todo = filteredTodos[index];
        return ListTile(
          title: Text(todo.title),
          trailing: Checkbox(
            value: todo.isCompleted,
            onChanged: (value) {
              // TODO: Update the todo
              todoProvider.updateTodo(
                todo.id,
                isCompleted: value,
              );
            },
          ),
          onLongPress: () {
            // TODO: Delete the todo
            todoProvider.deleteTodo(todo.id);
          },
        );
      },
    );
  }
}

class AddTodoButton extends StatelessWidget {
  const AddTodoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddTodoDialog(),
          );
        },
        child: const Text('작업 추가'),
      ),
    );
  }
}

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({super.key});

  @override
  _AddTodoDialogState createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final _titleController = TextEditingController();
  String _category = 'Work';

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);

    return AlertDialog(
      title: const Text('작업 추가'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: '제목'),
          ),
          DropdownButton<String>(
            value: _category,
            onChanged: (value) {
              setState(() {
                _category = value!;
              });
            },
            items: ['Work', 'Personal'].map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(category),
              );
            }).toList(),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('취소'),
        ),
        TextButton(
          onPressed: () {
            if (_titleController.text.isNotEmpty) {
              // TODO: Add the todo
              todoProvider.addTodo(Todo(
                id: DateTime.now().toString(),
                title: _titleController.text,
                category: _category,
              ));
              Navigator.of(context).pop();
            }
          },
          child: const Text('추가'),
        ),
      ],
    );
  }
}
