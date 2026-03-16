import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/Riverpod/get_api_riverpod/post_provider.dart';

class ApiScreen extends ConsumerWidget {
  const ApiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postList = ref.watch(postProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Api Screen"), centerTitle: true,),
      body: postList.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
            itemBuilder: (context, index) {
            final item = data[index];
            return Card(
              child: ListTile(
                title: Text(item.title),
                subtitle: Text(item.body),
              ),
            );
            }),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
