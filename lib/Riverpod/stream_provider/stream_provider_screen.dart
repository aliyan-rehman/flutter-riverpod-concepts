import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/Riverpod/stream_provider/stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build");
    return Scaffold(
      appBar: AppBar(title: Text("Stream Provider")),
      body: Consumer(builder: (context, ref, child) {
        final provider = ref.watch(stockPriceProvider);
        return Center(
          child: provider.when(
            data: (data) {
              return Center(
                child: Text(
                  data.toStringAsFixed(2).toString(),
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              );
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => CircularProgressIndicator(),
          ),
        );
      },)
    );
  }
}
