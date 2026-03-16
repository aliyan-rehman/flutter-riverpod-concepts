import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/Riverpod/state_notifier_provider/search/search_provider.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                onChanged: (value) {
                  ref.read(searchProvider.notifier).search(value);
                },
              ),
              Consumer(
                builder: (context, ref, child) {
                  final search = ref.watch(searchProvider);
                  return Text(search.search, style: TextStyle(fontSize: 24));
                },
              ),
              Consumer(
                builder: (context, ref, child) {
                  final isChange = ref.watch(searchProvider.select((value) => value.isChange,));
                  return Switch(
                      value: isChange,
                      onChanged: (value) {
                        ref.read(searchProvider.notifier).onChange(value);
                      },);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
