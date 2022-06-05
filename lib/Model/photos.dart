import 'package:flutter/material.dart';

class Photo with ChangeNotifier {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Photo({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "albumId": albumId,
      "title": title,
      "url": url,
      "thumbnailUrl": thumbnailUrl,
    };
  }

  Photo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    albumId = map['albumId'];
    title = map['title'];
    url = map['url'];
    thumbnailUrl = map['thumbnailUrl'];
  }
}
