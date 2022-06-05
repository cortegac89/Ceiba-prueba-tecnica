import 'package:flutter/material.dart';

Widget userDetails(
  BuildContext context,
  Size screenSize,
  Color color,
  double radi1,
  double radi2,
  String name,
  String phone,
  String email,
  int id,
) {
  return Row(
    children: [
      CircleAvatar(
        backgroundColor: color,
        radius: radi1,
        child: CircleAvatar(
            radius: radi2,
            backgroundImage: id.isEven
                ? AssetImage("assets/image/woman.jpg")
                : AssetImage("assets/image/man.jpg")),
      ),
      SizedBox(
        width: screenSize.width * 0.04,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenSize.width * 0.5,
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: screenSize.height * 0.02,
                  color: color,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            width: screenSize.width * 0.5,
            child: Text(
              phone,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: screenSize.height * 0.015,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w300),
            ),
          ),
          Container(
            width: screenSize.width * 0.5,
            child: Text(
              email,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: screenSize.height * 0.015,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      )
    ],
  );
}
