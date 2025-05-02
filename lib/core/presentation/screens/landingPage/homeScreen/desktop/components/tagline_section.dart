import 'package:flutter/material.dart';

import '../../../../../../Config/colors/colors.dart';

class TaglineSection extends StatelessWidget {
  const TaglineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "SnipScholar",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
          ),
          SizedBox(height: 8),
          Text(
            "Transforming Research, Together!",
            style: TextStyle(fontSize: 30, color: AppColors.teal),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}