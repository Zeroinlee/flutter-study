import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/activity.dart';
import 'enum_async_activity_provider.dart';
import 'enum_async_activity_state.dart';

class EnumAsyncActivityPage extends ConsumerWidget {
  const EnumAsyncActivityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activityState = ref.watch(enumAsyncActivityProvider);
    print(activityState.error);

    return Scaffold(
      appBar: AppBar(
        title: const Text('EnumAsyncActivityNotifier'),
      ),
      body: Center(
        child: switch (activityState.status) {
          ActivityStatus.loading => const CircularProgressIndicator(),
          ActivityStatus.failure =>
            activityState.activities.first == Activity.empty()
                ? Text(activityState.error)
                : ActivityWidget(activity: activityState.activities.first),
          ActivityStatus.success =>
            ActivityWidget(activity: activityState.activities.first),
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final randomNumber = Random().nextInt(activityTypes.length);
          ref.read(enumAsyncActivityProvider.notifier).fetchActivity(
                activityTypes[randomNumber],
              );
        },
        label: const Text('New Activity'),
      ),
    );
  }
}

class ActivityWidget extends StatelessWidget {
  final Activity activity;
  const ActivityWidget({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(activity.type),
        Text('activity: ${activity.activity}'),
        Text('accessibility: ${activity.accessibility}'),
        Text('participants: ${activity.participants}'),
        Text('price: ${activity.price}'),
        Text('key: ${activity.key}'),
      ],
    );
  }
}
