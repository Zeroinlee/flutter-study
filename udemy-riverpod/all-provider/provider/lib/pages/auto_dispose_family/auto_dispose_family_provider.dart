import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends Equatable {
  final int count;
  const Counter({
    required this.count,
  });

  @override
  String toString() => 'Counter(count: $count)';

  @override
  List<Object> get props => [count];
}

final counterProvider = Provider.autoDispose.family<int, Counter>(
  (ref, c) {
    print('[counterProvider($c)] created');

    ref.onDispose(
      () {
        print('[counterProvider($c)] disposed');
      },
    );

    return c.count;
  },
);

final autoDisposeFamilyHelloProvider =
    Provider.autoDispose.family<String, String>(
  (ref, name) {
    print('[autoDisposeFamilyHelloProvider($name)] created');

    ref.onDispose(
      () {
        print('[autoDisposeFamilyHelloProvider($name)] disposed');
      },
    );

    return 'Hello $name';
  },
);
