import 'package:flutter/material.dart';

import '../../../../../Config/colors/colors.dart';
import '../components/bell_notification_icon.dart';
import '../desktop/components/side_menu.dart';
import '../desktop/components/snippet_grid.dart';
import '../desktop/components/tagline_section.dart';
class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SizedBox(
          height: 40,
          child: TextField(
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              hintText: "Search ",
              suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded)),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.teal),
                borderRadius: BorderRadius.circular(12),

              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              filled: true,
              fillColor: Colors.white10,
            ),
          ),
        ),
        actions: [
          const NotificationIcon(notificationCount: 3),
          IconButton(icon: const Icon(Icons.person,size: 30,), onPressed: () {

          }),
        ],
      ),
      drawer: const SidebarMenu(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            TaglineSection(),
            SnippetGrid(),
          ],
        ),
      ),
    );
  }
}