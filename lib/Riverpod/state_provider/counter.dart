//State Provider Basics

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final counter = StateProvider<int>((ref) {
  return 0;
});

final switchProvider = StateProvider<bool>((ref) {
  return false;
});

class Counter extends ConsumerStatefulWidget {
  const Counter({super.key});

  @override
  ConsumerState<Counter> createState() => _CounterState();
}

class _CounterState extends ConsumerState<Counter> {
  @override
  Widget build(BuildContext context) {

    print("build");

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final count = ref.watch(counter);
                print("consumer build counter");
                return Center(
                  child: Text(count.toString(), style: TextStyle(fontSize: 24)),
                );
              },
            ),
            SizedBox(height: 20,),
            Consumer(
              builder: (context, ref, child) {
                print("consumer build switch");
                return Switch(
                  value: ref.watch(switchProvider),
                  onChanged: (value) {
                  ref.read(switchProvider.notifier).state = value;
                },);
              },
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(counter.notifier).state++;
                  },
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 20,),
                ElevatedButton(
                  onPressed: () {
                    ref.read(counter.notifier).state--;
                  },
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
