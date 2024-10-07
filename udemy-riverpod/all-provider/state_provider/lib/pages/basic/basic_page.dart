import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_provider/pages/basic/basic_provider.dart';

class BasicPage extends ConsumerWidget {
  const BasicPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final value = ref.watch(counterProvider);
    final value = ref.watch(ageProvider);

    ref.listen(
      counterProvider,
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
        title: const Text('StateProvider'),
      ),
      body: Center(
        child: Text('$value'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
      ),
    );
  }
}
