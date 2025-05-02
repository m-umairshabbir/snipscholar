import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../bloc/snippetCard/snippet_card_bloc.dart';


class SnippetCard extends StatelessWidget {
  final String snippetId;
  final String title;
  final String content;

  const SnippetCard({
    super.key,
    required this.snippetId,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SnippetBloc, SnippetState>(
      builder: (context, state) {
        final isExpanded = state.expandedMap[snippetId] ?? false;

        return GestureDetector(
          onTap: () => context.read<SnippetBloc>().add(ToggleSnippet(snippetId)),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            height: isExpanded ? 280 : 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  isExpanded ? Colors.teal.shade500 : Colors.teal.shade300,
                  Colors.blue.shade400
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: const [
                BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 10),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.lightbulb_outline, color: Colors.white, size: 40),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_outline, color: Colors.pink, size: 28),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.share, color: Colors.white, size: 28),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(title,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 8),
                  Text(content,
                      maxLines: isExpanded ? 5 : 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14, color: Colors.white70)),
                  const Spacer(),

                  Center(
                    child: IconButton(
                      icon: Icon(
                        isExpanded ? Icons.arrow_upward : Icons.arrow_downward,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () => context.read<SnippetBloc>().add(ToggleSnippet(snippetId)),
                    ),
                  ),

                  const SizedBox(height: 10),
                  if (isExpanded)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.teal,
                          ),
                          child: const Text("Explain"),
                        ),
                        const SizedBox(width: 15),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.teal,
                          ),
                          child: const Text("Summarize"),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
