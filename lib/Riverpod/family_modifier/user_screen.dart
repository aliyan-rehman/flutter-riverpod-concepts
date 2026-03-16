import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/Riverpod/family_modifier/provider.dart';

class UserScreen extends ConsumerWidget {
  final int userId;

  const UserScreen({required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 👇 Pass the argument here
    final userAsync = ref.watch(userByIdProvider(userId));

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: userAsync.when(
          data: (user) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('User ID: ${user.id}'),
              Text('Name: ${user.name}'),
            ]
          ),
          loading: () => CircularProgressIndicator(),
          error: (e, st) => Text('Error: $e'),
        ),
      ),
    );
  }
}
