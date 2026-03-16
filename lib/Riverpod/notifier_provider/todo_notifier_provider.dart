import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/Riverpod/notifier_provider/model/todo_model.dart';

// Provider definition
final todoProvider = NotifierProvider<TodoNotifier, List<Todo>>(
  () => TodoNotifier(),
);

class TodoNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() => []; // initial state = empty list

  void addTodo(String title) {
    state = [
      ...state,
      Todo(id: DateTime.now().millisecondsSinceEpoch.toString(), title: title),
    ];
  }

  void removeTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  void toggleTodo(String id) {
    state = state.map((todo) {
      if (todo.id == id) return todo.copyWith(isCompleted: !todo.isCompleted);
      return todo;
    }).toList();
  }

  void clearCompleted() {
    state = state.where((todo) => !todo.isCompleted).toList();
  }
}
