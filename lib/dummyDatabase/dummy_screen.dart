// lib/dummy_data_screen.dart

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DummyDataScreen extends StatelessWidget {
  const DummyDataScreen({super.key});

  /// Ensure the current user is in the `users/` collection
  Future<void> _addCurrentUserDoc() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final email = FirebaseAuth.instance.currentUser!.email;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({
      'name': 'Test User',
      'email': email,
      'createdAt': Timestamp.now(),
      'groups': ['group_1'],
    }, SetOptions(merge: true));
  }

  /// Create one or more groups owned by the current user
  Future<void> _addDummyGroups() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final groups = FirebaseFirestore.instance.collection('groups');

    await groups.doc('group_1').set({
      'name': 'Team A',
      'createdBy': uid,
      'createdAt': Timestamp.now(),
      'description': 'Group for marketing snippets',
      'members': [uid],
    });
  }

  /// Create a couple of snippets attributed to the current user
  Future<void> _addDummySnippets() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final snippets = FirebaseFirestore.instance.collection('snippets');

    await snippets.doc('snippet_abc').set({
      'title': 'Async/Await in JS',
      'content': 'that invests in bold founders with capital-efficient, disruptive, technology companies that can leverage capital and coaching to ..'
          'that invests in bold founders with capital-efficient, disruptive, technology companies that can leverage capital and coaching to ..'
          'that invests in bold founders with capital-efficient, disruptive, technology companies that can leverage capital and coaching to ..',
      'category': 'JavaScript',
      'createdBy': uid,
      'createdAt': Timestamp.now(),
      'access': 'public',
      'groupId': '',           // public snippet
      'favoritesCount': 2,
    });

    await snippets.doc('snippet_xyz').set({
      'title': 'Flutter BLoC Pattern',
      'content': 'Use BlocProvider and on<Event> to manage state…',
      'category': 'Flutter',
      'createdBy': uid,
      'createdAt': Timestamp.now(),
      'access': 'group',
      'groupId': 'group_1',
      'favoritesCount': 1,
    });
  }

  /// Mark those snippets as favorites for the current user
  Future<void> _addDummyFavorites() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final fav = FirebaseFirestore.instance.collection('favorites');

    await fav.doc(uid).set({
      'snippetIds': ['snippet_abc', 'snippet_xyz'],
    });
  }

  /// Master routine
  Future<void> _addAllDummyData(BuildContext context) async {
    try {
      await _addCurrentUserDoc();
      await _addDummyGroups();
      await _addDummySnippets();
      await _addDummyFavorites();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('🎉 Dummy data added for current user!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding dummy data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seed Dummy Data')),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.cloud_upload),
          label: const Text('Add Dummy Data'),
          onPressed: () => _addAllDummyData(context),
        ),
      ),
    );
  }
}
