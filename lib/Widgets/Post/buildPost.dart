import 'package:flutter/material.dart';

import '../Post/commentWidgets.dart';
import '../Post/usersPostWidgets.dart';

Widget buildPost(
    {BuildContext context,
    Size screenSize,
    Color color,
    String name,
    String phone,
    String email,
    String title,
    String body,
    int postID,
    int id}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 6),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
    ),
    padding: const EdgeInsets.all(12),
    child: Column(
      children: [
        userDetails(context, screenSize, color, screenSize.height * 0.030,
            screenSize.height * 0.025, name, phone, email, id),
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenSize.height * 0.0225),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            body,
            textAlign: TextAlign.left,
          ),
        ),
        CommentsSection(
          id: postID,
        ),
      ],
    ),
  );
}
