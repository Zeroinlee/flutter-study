import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AsyncDataScreen(),
    );
  }
}

final itemsProvider = FutureProvider<List<String>>((ref) async {
  // TODO: Return the asyncItems
  await Future.delayed(Duration(seconds: 2));
  return ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry', 'Fig', 'Grape'];
});

class AsyncDataScreen extends ConsumerWidget {
  const AsyncDataScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncItems = ref.watch(itemsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('비동기 데이터 가져오기')),
      body: Center(
        child: asyncItems.when(
          data: (items) => ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
              );
            },
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('에러: $error'),
        ),
      ),
    );
  }
}
