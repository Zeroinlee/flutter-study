import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifier_provider/pages/sealed_activity/sealed_activity_provider.dart';

import '../../models/activity.dart';
import '../enum_activity/enum_activity_page.dart';
import 'sealed_activity_state.dart';

class SealedActivityPage extends ConsumerStatefulWidget {
  const SealedActivityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SealedActivityPageState();
}

class _SealedActivityPageState extends ConsumerState<SealedActivityPage> {
  Widget? prevWidget;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(sealedActivityProvider.notifier).fetchActivity(activityTypes[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<SealedActivityState>(
      sealedActivityProvider,
      (previous, next) {
        switch (next) {
          case SealedActivityFailure(error: String error):
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

    final activityState = ref.watch(sealedActivityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SealedActivityNotifier'),
        actions: [
          IconButton(
            onPressed: () {
              ref.invalidate(sealedActivityProvider);
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: switch (activityState) {
          SealedActivityInitial() => const Text('Get some activity'),
          SealedActivityLoading() => const CircularProgressIndicator(),
          SealedActivityFailure() =>
            prevWidget == null ? const Text('Get some activity') : prevWidget!,
          SealedActivitySuccess(activities: List<Activity> activities) =>
            prevWidget = ActivityWidget(
              activity: activities.first,
            ),
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final randomNumber = Random().nextInt(activityTypes.length);
          ref
              .read(sealedActivityProvider.notifier)
              .fetchActivity(activityTypes[randomNumber]);
        },
        label: const Text('New Activity'),
      ),
    );
  }
}
