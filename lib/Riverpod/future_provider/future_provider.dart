import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<List<String>>((ref) async {
  await Future.delayed(const Duration(seconds: 2));

  // throw 'Internet Problem';
  return ["Aliyan Rehman", "Mustafa", "Sameer"];
},);