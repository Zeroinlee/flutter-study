import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/activity.dart';
import '../../providers/dio_provider.dart';
import 'sealed_activity_state.dart';

part 'sealed_activity_provider.g.dart';

@riverpod
class SealedActivity extends _$SealedActivity {
  @override
  SealedActivityState build() {
    ref.onDispose(() {
      print('[sealedActivityProvider] disposed');
    });
    return const SealedActivityInitial();
  }

  Future<void> fetchActivity(String activityType) async {
    state = const SealedActivityLoading();

    try {
      final response = await ref.read(dioProvider).get('?type=$activityType');

      final List activityList = response.data;

      final activities = [
        for (final activity in activityList) Activity.fromJson(activity),
      ];

      state = SealedActivitySuccess(activities: activities);
    } catch (e) {
      state = SealedActivityFailure(error: e.toString());
    }
  }
}
