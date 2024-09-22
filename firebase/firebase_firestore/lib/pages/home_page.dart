import 'package:firebase_firestore/pages/add_document_page.dart';
import 'package:firebase_firestore/pages/delete_document_page.dart';
import 'package:firebase_firestore/pages/filtered_data_page.dart';
import 'package:firebase_firestore/pages/list_document_page.dart';
import 'package:firebase_firestore/pages/post_management_page.dart';
import 'package:firebase_firestore/pages/read_document_page.dart';
import 'package:firebase_firestore/pages/real_time_updates_page.dart';
import 'package:firebase_firestore/pages/update_document_page.dart';
import 'package:firebase_firestore/pages/user_data_page.dart';
import 'package:firebase_firestore/pages/user_database_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListDocumentPage(),
                      ));
                },
                child: const Text('List Document Page')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddDocumentPage(),
                      ));
                },
                child: const Text('Add Document Page')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadDocumentPage(),
                      ));
                },
                child: const Text('Read Document Page')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateDocumentPage(),
                      ));
                },
                child: const Text('Update Document Page')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeleteDocumentPage(),
                      ));
                },
                child: const Text('Delete Document Page')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FilteredDataPage(),
                      ));
                },
                child: const Text('Filtered Data Page')),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDatabasePage(),
                      ));
                },
                child: const Text('User Database Page')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostManagementPage(),
                      ));
                },
                child: const Text('Post Management Page')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RealTimeUpdatesPage(),
                      ));
                },
                child: const Text('Real Time Updates Page')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDataPage(),
                      ));
                },
                child: const Text('User Data Page')),
          ],
        ),
      ),
    );
  }
}
