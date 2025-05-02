import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snipscholar/core/presentation/screens/landingPage/homeScreen/desktop/components/snippet_card.dart';

class SnippetGrid extends StatelessWidget {
  const SnippetGrid({super.key});

  Future<List<Map<String, dynamic>>> _fetchSnippets() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return [];

    // Get the current user's group list
    final userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final List<dynamic> groups = userDoc.data()?['groups'] ?? [];

    // Fetch all snippets by user or in user's groups
    final snapshot = await FirebaseFirestore.instance
        .collection('snippets')
        .where('access', whereIn: ['public', 'group']) // only public or group
        .get();

    final filtered = snapshot.docs.where((doc) {
      final data = doc.data();
      return data['createdBy'] == uid ||
          (data['access'] == 'group' && groups.contains(data['groupId']));
    });

    return filtered.map((doc) {
      final data = doc.data();
      return {
        'title': data['title'] ?? '',
        'content': data['content'] ?? '',
        'snippetId': doc.id,
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _fetchSnippets(), // Fetch snippets from Firestore
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError || !snapshot.hasData) {
          return const Center(child: Text('Failed to load snippets.'));
        }

        final snippets = snapshot.data!;
        if (snippets.isEmpty) {
          return const Center(child: Text('No snippets available.'));
        }

        return GridView.builder(
          shrinkWrap: true,                           // ← let it size itself
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          padding: const EdgeInsets.all(16),
          itemCount: snippets.length,
          itemBuilder: (context, index) {
            final snippet = snippets[index];
            return SnippetCard(
              title: snippet['title'],
              content: snippet['content'],
              snippetId: snippet['snippetId'],
            );
          },
        );
      },
    );
  }
}
