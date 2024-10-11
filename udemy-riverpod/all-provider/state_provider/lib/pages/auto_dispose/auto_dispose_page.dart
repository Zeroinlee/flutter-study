import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auto_dispose_provider.dart';

class AutoDisposePage extends ConsumerWidget {
  const AutoDisposePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(autoDisposeAgeProvider);

    ref.listen(
      autoDisposeCounterProvider,
      (previous, next) {
        if (next % 3 == 0) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('counter: $next'),
              );
            },
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoDisposeStateProvider'),
      ),
      body: Center(
        child: Text('$value'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(autoDisposeCounterProvider.notifier).update(
                (state) => state + 2,
              );
        },
      ),
    );
  }
}
