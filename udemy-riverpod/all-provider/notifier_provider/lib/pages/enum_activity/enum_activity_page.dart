import 'dart:math';

import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifier_provider/pages/enum_activity/enum_activity_provider.dart';
import 'package:notifier_provider/pages/enum_activity/enum_activity_state.dart';

import '../../models/activity.dart';

class EnumActivityPage extends ConsumerStatefulWidget {
  const EnumActivityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EnumActivityPageState();
}

class _EnumActivityPageState extends ConsumerState<EnumActivityPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(enumActivityProvider.notifier).fetchActivity(activityTypes[0]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final activityState = ref.watch(enumActivityProvider);
    print(activityState.error);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enum Activity Page'),
      ),
      body: Center(
        child: switch (activityState.status) {
          ActivityStatus.initial => const Text('Get some activity'),
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
          ref.read(enumActivityProvider.notifier).fetchActivity(
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
        BulletedList(listItems: [
          'activity: ${activity.activity}',
          'accessibility: ${activity.accessibility}',
          'participants: ${activity.participants}',
          'price: ${activity.price}',
          'key: ${activity.key}',
        ])
      ],
    );
  }
}
