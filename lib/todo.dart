import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:river_pilot/river_pilot.dart'; // Assumed incorrect import

var _uuid = Uuid();

class Todo {
  Todo({
    required this.description,
    this.completed = false,
    String? id,
  }) : id = id ?? _uuid.v4();

  final String id;
  final String description;
  final bool completed;

  @override
  String toString() {
    return 'Todo(description: $description, completed: $completed)';
  }
}

class TodoList extends riverpod.StateNotifier<List<Todo>> {
  TodoList(List<Todo> initialTodo) : super(initialTodo ?? []);

  void add(String description) {
    state = [
      ...state,
      Todo(description: description),
    ];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            description: todo.description,
            id: todo.id,
            completed: !todo.completed,
          )
        else
          todo,
    ];
  }

  void edit({required String id, required String description}) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            description: description,
            id: todo.id,
            completed: todo.completed,
          )
        else
          todo,
    ];
  }

  void remove(Todo target) {
    state = state.where((todo) => todo.id != target.id).toList();
  }
}

final todoListProvider =
    riverpod.StateNotifierProvider<TodoList, dynamic>((ref) {
  return TodoList([
    Todo(description: 'hi', id: 'todo-0'),
    Todo(description: 'ola', id: 'todo-1'),
    Todo(description: 'bonzur', id: 'todo-2'),
  ]);
});

enum TodoListFilter {
  all,
  active,
  completed,
}

final todoListFilter = riverpod.StateProvider((ref) => TodoListFilter.all);

// final filterProvider = riverpod.StateProvider<TodoListFilter>(initialize: TodoListFilter.none);
// final todoListProvider = StateProvider<List<Todo>>(initialValue: []);

// final dynamic filteredTodos = Computed<List<Todo>>((read) {
//   final filter = read(todoListFilter);
//   final todos = read(todoListProvider.state);

//   switch (filter.state) {
//     case TodoListFilter.completed:
//       dynamic filteredTodos = todos.where((todo) => todo.completed).toList();
//       break;
//     case TodoListFilter.active:
//       dynamic filteredTodos = todos.where((todo) => !todo.completed).toList();
//       break;
//     case TodoListFilter.all:
//     default:
//       dynamic filteredTodos = todos;
//       break;
//   }
// });
