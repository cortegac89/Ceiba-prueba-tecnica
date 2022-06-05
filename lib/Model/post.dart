import 'package:flutter/material.dart';

class PostDetails with ChangeNotifier {
  int userId;
  int id;
  String title;
  String body;

  PostDetails({this.userId, this.id, this.title, this.body});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "userId": userId,
      "title": title,
      "body": body,
    };
  }

  PostDetails.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    userId = map['userId'];
    title = map['title'];
    body = map['body'];
  }
}

class PostComments with ChangeNotifier {
  int postId;
  int id;
  String name;
  String phone;
  String body;
  String email;

  PostComments({this.postId, this.id, this.name, this.phone, this.body, this.email});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "postId": postId,
      "name": name,
      "phone": phone,
      "body": body,
      "email": email
    };
  }

  PostComments.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    postId = map['postId'];
    name = map['name'];
    phone = map['phone'];
    body = map['body'];
    email = map['email'];
  }
}
