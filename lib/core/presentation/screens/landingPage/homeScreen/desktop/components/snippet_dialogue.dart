import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../../Config/colors/colors.dart';

void showSnippetDialog(BuildContext context, String title, String content) {
  TextEditingController textController = TextEditingController(text: content);
  bool isEditing = false;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.7,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                          PopupMenuButton<String>(
                            icon: const Icon(Icons.more_vert, color: Colors.white),
                            onSelected: (value) {
                              if (value == 'edit') {
                                setState(() {
                                  isEditing = true;
                                });
                              } else if (value == 'delete') {
                                Navigator.pop(context);
                                // Handle deletion logic here
                              }
                            },
                            itemBuilder: (BuildContext context) => [
                              const PopupMenuItem(value: 'edit', child: Text('Edit')),
                              const PopupMenuItem(value: 'delete', child: Text('Delete')),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Add your button action here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor, // Button color
                              foregroundColor: AppColors.whitish, // Text color
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8), // Border radius
                                side: const BorderSide(color: AppColors.teal, width: 2), // Border side
                              ),
                            ),
                            child: const Text("Explain"),
                          ),
                          const SizedBox(width: 20,),
                          ElevatedButton(
                            onPressed: () {
                              // Add your button action here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor, // Button color
                              foregroundColor: AppColors.whitish, // Text color
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8), // Border radius
                                side: const BorderSide(color: AppColors.teal, width: 2), // Border side
                              ),
                            ),
                            child: const Text("Summarize"),
                          )


                        ],
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: isEditing
                            ? TextField(
                          controller: textController,
                          maxLines: null,
                          decoration: const InputDecoration(border: OutlineInputBorder()
                          ),
                        )
                            : SingleChildScrollView(
                          child: Text(content, style: const TextStyle(color: Colors.white70)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (isEditing)
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    isEditing = false;
                                  });
                                  // Handle save logic here
                                },
                                child: const Text("Save"),
                              ),
                            ElevatedButton(
                              onPressed: () {
                                // Add your button action here
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.teal, // Button color
                                foregroundColor: Colors.white, // Text color
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16), // Border radius
                                  side: const BorderSide(color: Colors.white, width: 2), // Border side
                                ),
                              ),
                              child: const Text("Close"),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
