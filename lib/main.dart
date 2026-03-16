import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/Riverpod/async_notifier_provider/post_screen.dart';
import 'package:riverpod_tutorial/Riverpod/family_modifier/user_screen.dart';
import 'package:riverpod_tutorial/Riverpod/future_provider/future_provider_screen.dart';
import 'package:riverpod_tutorial/Riverpod/get_api_riverpod/api_screen.dart';
import 'package:riverpod_tutorial/Riverpod/notifier_provider/todo_screen.dart';
import 'package:riverpod_tutorial/Riverpod/state_notifier_provider/CRUD/crud_screen.dart';
import 'package:riverpod_tutorial/Riverpod/state_notifier_provider/favourite_app/favourite_screen.dart';
import 'package:riverpod_tutorial/Riverpod/state_notifier_provider/search/search_screen.dart';
import 'package:riverpod_tutorial/Riverpod/state_provider/counter.dart';
import 'package:riverpod_tutorial/Riverpod/state_provider/slider_screen.dart';
import 'package:riverpod_tutorial/Riverpod/stream_provider/stream_provider_screen.dart';

import 'Riverpod/provider/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: UserScreen(userId: 11),
      ),
    );
  }
}
