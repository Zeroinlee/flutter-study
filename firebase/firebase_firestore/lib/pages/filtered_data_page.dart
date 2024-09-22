import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FilteredDataPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> _getFilteredData() {
    // 필터 조건을 설정 하세요.
    return _firestore
        .collection('documents')
        .where('status', isEqualTo: 'active')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtered Data from Firestore'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _getFilteredData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No documents found.'));
          } else {
            final documents = snapshot.data!.docs;
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final doc = documents[index].data() as Map<String, dynamic>;
                return ListTile(
                  title: Text(doc['title'] ?? 'No Title'),
                  subtitle: Text(doc['content'] ?? 'No Content'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
