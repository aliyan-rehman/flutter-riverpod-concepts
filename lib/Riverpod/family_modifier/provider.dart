import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/Riverpod/family_modifier/model/user.dart';

final userByIdProvider = FutureProvider.family<User, int>((ref, userId) async {
  return User(id: userId, name: "Aliyan");
});

// final userByIdProvider = FutureProvider.family<User, int>((ref, userId) async {
//   final response = await http.get(
//     Uri.parse('https://jsonplaceholder.typicode.com/users/$userId'),
//   );
//   return User.fromJson(jsonDecode(response.body));
// });

// // StateProvider.family
// final counterFamily = StateProvider.family<int, String>((ref, label) => 0);
//
// // Provider.family
// final greetingProvider = Provider.family<String, String>((ref, name) {
//   return 'Hello, $name!';
// });
//
// // NotifierProvider.family
// final todosFamily = NotifierProvider.family<TodosNotifier, List<Todo>, String>(
//     TodosNotifier.new
// );