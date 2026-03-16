// post_provider.dart
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_tutorial/Riverpod/async_notifier_provider/model/post_model.dart';

// The provider
final postProvider = AsyncNotifierProvider<PostNotifier, List<PostModel>>(
  () => PostNotifier(),
);

class PostNotifier extends AsyncNotifier<List<PostModel>> {
  // build() = initial fetch, runs automatically when provider is first used
  @override
  Future<List<PostModel>> build() async {
    return await _fetchPosts();
  }

  // private fetch method
  Future<List<PostModel>> _fetchPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),

      headers: {
        // Spoofing a browser User-Agent tricks the server into allowing the request.
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
        'Accept': 'application/json',
      },
    );
    final List json = jsonDecode(response.body);
    return json.map((e) => PostModel.fromJson(e)).toList();
  }

  // Refresh — re-runs build()
  Future<void> refreshPosts() async {
    state = AsyncLoading(); // show loading
    state = await AsyncValue.guard(() => _fetchPosts());
    //                       👆 guard catches errors automatically
  }

  // Add a post locally (optimistic update)
  void addPost(PostModel post) {
    // only run if we have data
    state.whenData((posts) {
      state = AsyncData([post, ...posts]);
    });
  }

  // Delete a post locally
  void deletePost(int id) {
    state.whenData((posts) {
      state = AsyncData(posts.where((post) => post.id != id).toList());
    });
  }

  // Update a post locally
  void updatePost(int id, String newTitle) {
    state.whenData((posts) {
      state = AsyncData(
        posts.map((post) {
          if (post.id == id) return post.copyWith(title: newTitle);
          return post;
        }).toList(),
      );
    });
  }
}
