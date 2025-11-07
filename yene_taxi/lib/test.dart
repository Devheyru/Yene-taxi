import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestFirebasePage extends StatelessWidget {
  const TestFirebasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Test')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              await firestore.collection('test').add({'time': DateTime.now()});
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Firebase working! Document added.'),
                ),
              );
            } catch (e) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Error: $e')));
            }
          },
          child: const Text('Test Firestore'),
        ),
      ),
    );
  }
}
