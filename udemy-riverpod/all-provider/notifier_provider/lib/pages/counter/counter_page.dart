import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifier_provider/pages/counter/counter_provider.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider(10));
    print(counter);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('$counter'),
            OutlinedButton(
                onPressed: ref.read(counterProvider(10).notifier).increment,
                child: const Text('Increment')),
            OutlinedButton(
                onPressed: ref.read(counterProvider(10).notifier).decrement,
                child: const Text('Decrement')),
          ],
        ),
      ),
    );
  }
}
