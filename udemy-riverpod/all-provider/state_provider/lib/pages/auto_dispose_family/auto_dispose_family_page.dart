import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AutoDisposeFamilyPage extends ConsumerWidget {
  const AutoDisposeFamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final incVal = ref.watch(familyCounterProvider(10));
    // final decVal = ref.watch(familyCounterProvider(-10));

    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoDisposeFamilyStateProvider'),
      ),
      body: Center(
        child: Column(
          children: [
            // Text('incVal: $incVal'),
            // Text('decVal: $decVal'),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(onPressed: () {}),
          FloatingActionButton(onPressed: () {}),
        ],
      ),
    );
  }
}
