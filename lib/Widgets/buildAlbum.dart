import 'package:flutter/material.dart';
import '../Screen/PhotosScreen.dart';

Widget buildAlbum(BuildContext context, Size screenSize) {
  return Column(
    children: [
      InkWell(
        onTap: () => Navigator.of(context).pushNamed(PhotoScreen.routeName),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: NetworkImage("https://via.placeholder.com/150/92c952"),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(30),
          ),
          height: screenSize.height * 0.20,
          width: screenSize.height * 0.24,
          margin: const EdgeInsets.all(2),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "non esse culpa molestiae omnis sed optio",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.white, fontSize: screenSize.height * 0.02),
        ),
      )
    ],
  );
}
