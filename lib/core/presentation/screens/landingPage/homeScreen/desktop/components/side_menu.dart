import 'package:flutter/material.dart';

import '../../../../../../Config/colors/colors.dart';

class SidebarMenu extends StatefulWidget {
  const SidebarMenu({super.key});

  @override
  _SidebarMenuState createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  int selectedIndex = 0; // Track selected menu item

  final List<Map<String, dynamic>> menuItems = [
    {"icon": Icons.dashboard, "title": "Dashboard"},
    {"icon": Icons.book, "title": "My Snippets"},
    {"icon": Icons.group_outlined, "title": "Collaboration"},
    {"icon": Icons.explore, "title": "FAQ's"},
    {"icon": Icons.contact_mail, "title": "About Us"},
    {"icon": Icons.phone, "title": "Contact Us"},
  ];

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width >= 800;
    return Drawer(
      backgroundColor: AppColors.primaryColor,
      child: Column(
        children: [
          const SizedBox(height: 15),
          // Sidebar Header with Image
          if (!isDesktop)
            Image.asset(
              "images/logo.png", // ✅ Show only in mobile view
              height: 100,
              width: 180,
              fit: BoxFit.contain,
            ),
          const SizedBox(height: 10),

          // Menu Items
          ...List.generate(menuItems.length, (index) {
            bool isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.teal : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(
                    menuItems[index]["icon"],
                    color: isSelected ? AppColors.whitish : Colors.white70,
                    size: 30,
                  ),
                  title: Text(
                    menuItems[index]["title"],
                    style: TextStyle(
                      fontSize: 20,
                      color: isSelected ? AppColors.whitish : Colors.white,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          }),

          const Spacer(),

          // Logout Button
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Handle Logout
              },
              icon: const Icon(Icons.logout, color: Colors.white, size: 24),
              label: const Text(
                "Logout",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.teal,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}