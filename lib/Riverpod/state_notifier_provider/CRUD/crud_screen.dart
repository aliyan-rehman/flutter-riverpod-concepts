import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/Riverpod/state_notifier_provider/CRUD/item__provider.dart';

class CrudScreen extends ConsumerWidget {
  const CrudScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);

    return Scaffold(
      appBar: AppBar(),
      body: item.isEmpty
          ? Center(child: Text("No data found"))
          : ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                final itemDetail = item[index];
                return ListTile(
                  title: Text(itemDetail.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          ref.read(itemProvider.notifier).updateItem(itemDetail.id, "Updated Item");
                        },
                        icon: Icon(Icons.edit, color: Colors.grey),
                      ),
                      IconButton(
                        onPressed: () {
                          ref.read(itemProvider.notifier).deleteItem(itemDetail.id);
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem("Item Name");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
