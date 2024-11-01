import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/activity.dart';
import '../enum_activity/enum_activity_page.dart';
import 'sealed_async_activity_provider.dart';
import 'sealed_async_activity_state.dart';

class SealedAsyncActivityPage extends ConsumerStatefulWidget {
  const SealedAsyncActivityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SealedAsyncActivityPageState();
}

class _SealedAsyncActivityPageState
    extends ConsumerState<SealedAsyncActivityPage> {
  Widget? prevWidget;

  @override
  Widget build(BuildContext context) {
    ref.listen<SealedAsyncActivityState>(
      sealedAsyncActivityProvider,
      (previous, next) {
        switch (next) {
          case SealedAsyncActivityFailure(error: String error):
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(error),
                );
              },
            );
          case _:
        }
      },
    );

    final activityState = ref.watch(sealedAsyncActivityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SealedAsyncActivityNotifier'),
        actions: [
          IconButton(
            onPressed: () {
              ref.invalidate(sealedAsyncActivityProvider);
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: switch (activityState) {
          SealedAsyncActivityLoading() => const CircularProgressIndicator(),
          SealedAsyncActivityFailure() =>
            prevWidget == null ? const Text('Get some activity') : prevWidget!,
          SealedAsyncActivitySuccess(activities: List<Activity> activities) =>
            prevWidget = ActivityWidget(
              activity: activities.first,
            ),
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final randomNumber = Random().nextInt(activityTypes.length);
          ref
              .read(sealedAsyncActivityProvider.notifier)
              .fetchActivity(activityTypes[randomNumber]);
        },
        label: const Text('New Activity'),
      ),
    );
  }
}
