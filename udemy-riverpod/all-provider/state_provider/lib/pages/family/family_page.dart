import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'family_provider.dart';

class FamilyPage extends ConsumerWidget {
  const FamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incVal = ref.watch(familyCounterProvider(10));
    final decVal = ref.watch(familyCounterProvider(-10));

    return Scaffold(
      appBar: AppBar(
        title: const Text('FamilyStateProvider'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('incVal: $incVal'),
            Text('decVal: $decVal'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                    heroTag: 'inc',
                    onPressed: () {
                      ref.read(familyCounterProvider(10).notifier).update(
                            (state) => state + 10,
                          );
                    }),
                FloatingActionButton(
                    heroTag: 'dec',
                    onPressed: () {
                      ref.read(familyCounterProvider(-10).notifier).update(
                            (state) => state - 10,
                          );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
