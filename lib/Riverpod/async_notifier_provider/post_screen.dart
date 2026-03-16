// post_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/Riverpod/async_notifier_provider/async_notifier_provider.dart';
import 'package:riverpod_tutorial/Riverpod/async_notifier_provider/model/post_model.dart';

class PostScreen extends ConsumerWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(postProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        centerTitle: true,
        actions: [
          // Refresh button
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => ref.read(postProvider.notifier).refreshPosts(),
          ),
        ],
      ),

      body: postState.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: $error'),
              ElevatedButton(
                onPressed: () => ref.read(postProvider.notifier).refreshPosts(),
                child: Text('Retry'),
              ),
            ],
          ),
        ),
        data: (posts) => ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                title: Text(
                  post.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  post.body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    ref.read(postProvider.notifier).deletePost(post.id);
                  },
                ),
              ),
            );
          },
        ),
      ),

      // Add a fake post
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(postProvider.notifier)
              .addPost(
                PostModel(
                  id: DateTime.now().millisecondsSinceEpoch,
                  title: 'New Post ${DateTime.now().second}',
                  body: 'This is a new post added locally',
                ),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
