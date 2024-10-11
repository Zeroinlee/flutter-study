import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/activity.dart';
import '../../providers/dio_provider.dart';
import 'enum_async_activity_state.dart';

part 'enum_async_activity_provider.g.dart';

@riverpod
class EnumAsyncActivity extends _$EnumAsyncActivity {
  EnumAsyncActivity() {
    print('[EnumAsyncActivity] constructor called');
  }

  @override
  EnumAsyncActivityState build() {
    print('[enumAsyncActivityProvider] initialized');
    ref.onDispose(() {
      print('[enumAsyncActivityProvider] disposed');
    });
    state = EnumAsyncActivityState.initial();
    fetchActivity(activityTypes[0]);
    return EnumAsyncActivityState.initial();
  }

  Future<void> fetchActivity(String activityType) async {
    state = state.copyWith(status: ActivityStatus.loading);

    try {
      final response = await ref.read(dioProvider).get('?type=$activityType');

      final List activityList = response.data;

      final activities = [
        for (final activity in activityList) Activity.fromJson(activity),
      ];

      state = state.copyWith(
        status: ActivityStatus.success,
        activities: activities,
      );
    } catch (e) {
      state = state.copyWith(
        status: ActivityStatus.failure,
        error: e.toString(),
      );
    }
  }
}
