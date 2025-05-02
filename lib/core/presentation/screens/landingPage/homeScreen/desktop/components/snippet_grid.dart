import 'package:flutter/material.dart';
import 'package:snipscholar/core/presentation/screens/landingPage/homeScreen/desktop/components/snippet_card.dart';

class SnippetGrid extends StatelessWidget {
  const SnippetGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      
      crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 1,
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,  // Allows it to scroll with SingleChildScrollView
      physics: const NeverScrollableScrollPhysics(),  // Prevents internal scrolling
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: SnippetCard(title: "Education", content: '', snippetId: '1',),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: SnippetCard(title: "Medical", snippetId: '2', content: '2',),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: SnippetCard(title: "AI Research", snippetId: '3', content: '2',),
        ),
        // Repeat for other cards...
      ],

    );
  }
}
