import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/pages/auto_dispose/auto_dispose_provider.dart';

class AutoDisposePage extends StatelessWidget {
  const AutoDisposePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoDisposeProvider'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final hello = ref.watch(autoDisposeHelloProvider);

            return Text(hello);
          },
        ),
      ),
    );
  }
}
