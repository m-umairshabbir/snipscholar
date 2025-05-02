import 'package:flutter/material.dart';

import 'components/navbar.dart';
import 'components/side_menu.dart';
import 'components/snippet_grid.dart';
import 'components/tagline_section.dart';


class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          TopNavBar(),
          Expanded(
            child: Row(
              children: [
                Expanded(flex: 2, child: SidebarMenu()),
                Expanded(
                  flex: 8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TaglineSection(),
                        SnippetGrid(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}