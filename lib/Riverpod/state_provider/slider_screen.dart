import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/Riverpod/state_provider/slider_provider.dart';

class SliderScreen extends ConsumerStatefulWidget {
  const SliderScreen({super.key});

  @override
  ConsumerState<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends ConsumerState<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final slider = ref.watch(sliderProvider.select((value) => value.showPassword,)); // using select so that only this widget rebuild
              final sliderValue = ref.watch(sliderProvider.select((value) => value.slider));//for container alpha value
              print("Consumer build Container");
              return InkWell(
                onTap: () {
                  final stateProvider = ref.read(sliderProvider.notifier);
                  stateProvider.state = stateProvider.state.copyWith(
                    showPassword: !slider,
                  );
                },
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.red.withValues(alpha: sliderValue),
                  child: slider
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final slider = ref.watch(sliderProvider.select((value) => value.slider,)); // using select so that only this widget rebuild
              print("Consumer build Slider");
              return Slider(
                value: slider,
                onChanged: (value) {
                  final stateProvider = ref.read(sliderProvider.notifier);
                  stateProvider.state = stateProvider.state.copyWith(
                    slider: value,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
