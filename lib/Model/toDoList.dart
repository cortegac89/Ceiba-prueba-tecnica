import 'package:flutter/cupertino.dart';

class ToDolist with ChangeNotifier {
  int id;
  String title;

  ToDolist({this.id, this.title});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "title": title,
    };
  }

  ToDolist.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
  }
}
