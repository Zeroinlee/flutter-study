import 'package:async_notifier_provider/models/activity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'async_activity_provider.g.dart';

@riverpod
class AsyncActivity extends _$AsyncActivity {
  @override
  FutureOr<Activity> build() {
    ref.onDispose(() {
      print('[asyncActivityProvider] disposed');
    });
    return;
  }
}
