import 'package:flutter/material.dart';

class Albums with ChangeNotifier {
  int userId;
  int id;
  String title;

  Albums({
    this.userId,
    this.id,
    this.title,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "userId": userId,
      "title": title,
    };
  }

  Albums.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    userId = map['userId'];
    title = map['title'];
  }
}
