import 'package:async_notifier_provider/pages/counter/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    print(counter);
    print(
        'isLoading: ${counter.isLoading}, isRefreshing: ${counter.isRefreshing}, isReloading: ${counter.isReloading}');
    print('hasValue: ${counter.hasValue}, hasError: ${counter.hasError}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: counter.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Column(
            children: [
              Text(error.toString()),
              OutlinedButton(
                  onPressed: () {
                    ref.invalidate(counterProvider);
                  },
                  child: const Text('Refresh')),
            ],
          ),
          data: (count) {
            return Column(
              children: [
                Text('$count'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      heroTag: 'decrement',
                      onPressed: () {
                        ref.read(counterProvider.notifier).decrement();
                      },
                      child: const Icon(Icons.remove),
                    ),
                    FloatingActionButton(
                      heroTag: 'increment',
                      onPressed: () {
                        ref.read(counterProvider.notifier).increment();
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
