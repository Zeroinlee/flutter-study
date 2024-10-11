import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/activity.dart';

part 'enum_async_activity_state.freezed.dart';

enum ActivityStatus {
  loading,
  success,
  failure,
}

@freezed
class EnumAsyncActivityState with _$EnumAsyncActivityState {
  const factory EnumAsyncActivityState({
    required ActivityStatus status,
    required List<Activity> activities,
    required String error,
  }) = _EnumActivityState;

  factory EnumAsyncActivityState.initial() {
    return EnumAsyncActivityState(
      status: ActivityStatus.loading,
      activities: [Activity.empty()],
      error: '',
    );
  }
}
