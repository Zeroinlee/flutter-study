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
      home: FilteredListScreen(),
    );
  }
}

final itemsProvider = Provider<List<String>>((ref) {
  return [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grape',
  ];
});

final filterProvider = StateProvider<String>((ref) => '');

final filteredItemsProvider = Provider<List<String>>((ref) {
  final items = ref.watch(itemsProvider);
  final filter = ref.watch(filterProvider);

  if (filter.isEmpty) {
    return items;
  } else {
    return items
        .where((item) => item.toLowerCase().contains(filter.toLowerCase()))
        .toList();
  }
});

class FilteredListScreen extends ConsumerWidget {
  const FilteredListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { 
    // TODO: Implement the watch method
    final filteredItems =

    return Scaffold(
      appBar: AppBar(title: const Text('목록 필터링')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                // TODO: Implement the read method
              },
              decoration: const InputDecoration(
                labelText: '필터링 키워드 입력',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredItems[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
