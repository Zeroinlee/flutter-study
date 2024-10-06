import 'package:flutter_riverpod/flutter_riverpod.dart';

final familyHelloProvider = Provider.family<String, String>(
  (ref, name) {
    print('[familyHelloProvider($name)] created');

    ref.onDispose(
      () {
        print('[familyHelloProvider($name)] disposed');
      },
    );

    return 'Hello $name';
  },
);
