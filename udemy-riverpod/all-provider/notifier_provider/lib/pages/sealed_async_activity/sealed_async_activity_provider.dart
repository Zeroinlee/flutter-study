import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/activity.dart';
import '../../providers/dio_provider.dart';
import 'sealed_async_activity_state.dart';

part 'sealed_async_activity_provider.g.dart';

@riverpod
class SealedAsyncActivity extends _$SealedAsyncActivity {
  SealedAsyncActivity() {
    print('[SealedAsyncActivity] constructor called');
  }
  @override
  SealedAsyncActivityState build() {
    ref.onDispose(() {
      print('[sealedAsyncActivityProvider] disposed');
    });
    fetchActivity(activityTypes[0]);
    return const SealedAsyncActivityLoading();
  }

  Future<void> fetchActivity(String activityType) async {
    state = const SealedAsyncActivityLoading();

    try {
      final response = await ref.read(dioProvider).get('?type=$activityType');

      final List activityList = response.data;

      final activities = [
        for (final activity in activityList) Activity.fromJson(activity),
      ];

      state = SealedAsyncActivitySuccess(activities: activities);
    } catch (e) {
      state = SealedAsyncActivityFailure(error: e.toString());
    }
  }
}
