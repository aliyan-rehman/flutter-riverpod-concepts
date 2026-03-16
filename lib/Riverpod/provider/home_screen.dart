import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final name = Provider<String>((ref) {
  return "Aliyan Rehman";
},);

final age = Provider<int>((ref) {
  return 25;
},);

//-------------Using Stateful Widget--------------
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final myName = ref.watch(name);
    final myAge = ref.watch(age);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(myName, style: TextStyle(fontSize: 24),),
            Text(myAge.toString(), style: TextStyle(fontSize: 24),),
          ],
        ),
      ),
    );
  }
}



//-------------Using Stateless Widget--------------
// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//
//     final myName = ref.watch(name);
//     final myAge = ref.watch(age);
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(myName, style: TextStyle(fontSize: 24),),
//             Text(myAge.toString(), style: TextStyle(fontSize: 24),),
//           ],
//         ),
//       ),
//     );
//   }
// }
