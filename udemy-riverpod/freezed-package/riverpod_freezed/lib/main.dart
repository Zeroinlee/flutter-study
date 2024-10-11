import 'package:flutter/material.dart';
import 'package:riverpod_freezed/models/mutable_person.dart';
import 'package:riverpod_freezed/pages/mutable_person_page.dart';

import 'pages/collections_page.dart';
import 'pages/person_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PersonPage(),
                    ));
              },
              child: const Text('Person'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MutablePersonPage(),
                    ));
              },
              child: const Text('Mutable Person'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CollectionsPage(),
                    ));
              },
              child: const Text('Collections'),
            ),
          ],
        ),
      ),
    );
  }
}
