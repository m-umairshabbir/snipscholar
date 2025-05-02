import 'package:flutter/material.dart';
import 'package:snipscholar/core/Config/colors/colors.dart';

import '../../components/bell_notification_icon.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "images/logo.png",
            height: 70,
            width: 180,
            fit: BoxFit.contain,
            color: AppColors.primaryColor,
          ),
          const Spacer(),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                hintText: "Search",
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22)),
                    borderSide: BorderSide(color: AppColors.primaryColor)),
                filled: true,
                fillColor: Colors.white10,
              ),
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            child: const Text("Dashboard",style: TextStyle(color: AppColors.whitish),),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
            child: const Text("Explore",style: TextStyle(color: AppColors.whitish)),
          ),
          const SizedBox(width: 16),

          const NotificationIcon(notificationCount: 3),
          IconButton(icon: const Icon(Icons.person), onPressed: () {}),
        ],
      ),
    );
  }
}
