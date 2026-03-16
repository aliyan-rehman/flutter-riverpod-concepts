import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/Riverpod/state_notifier_provider/favourite_app/provider/favourite_provider.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteList = ref.watch(favouriteProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite App"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              ref.read(favouriteProvider.notifier).favourite(value);
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(value: "All", child: Text("All")),
                PopupMenuItem(value: "Favourite", child: Text("Favourite")),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                ref.read(favouriteProvider.notifier).filterList(value);
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: favouriteList.filteredItems.length,
                itemBuilder: (context, index) {
                  final item = favouriteList.filteredItems[index];
                  return ListTile(
                    title: Text(item.name),
                    trailing: Icon(
                      item.favourite ? Icons.favorite : Icons.favorite_border,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(favouriteProvider.notifier).addItem();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
