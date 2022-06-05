import 'dart:convert';
import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/toDoList.dart';

import '../providers/sqlTableData.dart';
import './db_provider.dart';
import '../Model/users.dart';
import '../Model/photos.dart';
import '../Model/albums.dart';
import '../Model/post.dart';

class DataProvider with ChangeNotifier {
  var isInt = true;
  //creating array for data
  List<UsersInfo> _userInfo = [];
  List<UsersInfo> get userInfo {
    return [..._userInfo];
  }

  List<Albums> _album = [];

  List<Albums> get album {
    return [..._album];
  }

  List<ToDolist> _toDoList = [];

  List<ToDolist> get toDoList {
    return [..._toDoList];
  }

  List<Photo> _photo = [];

  List<Photo> get photo {
    return [..._photo];
  }

  List<PostDetails> _postDetails = [];
  List<PostDetails> get postDetails {
    return [..._postDetails];
  }

  List<PostComments> _postComments = [];

  List<PostComments> get postComments {
    return [..._postComments];
  }

  url(String link) =>
      "https://jsonplaceholder.typicode.com/$link"; //universal link

  fetchApi() async {
    await userDataFetch();
    await postDetailData();
    await albumData();
    postCommentsData();
    photoData();
  }

  fetchDatabase() async {
    await DBProvider().getInfo(_userInfo, UsersList, USERTABLE);
    await DBProvider().getInfo(_postDetails, PostList, POSTTABLE);
    await DBProvider().getInfo(_postComments, PostCommentsList, COMMENTTABLE);
    await DBProvider().getInfo(_album, AlbumList, ALBUMTABLE);
    await DBProvider().getInfo(_photo, PHOTOList, PHOTOTABLE);
    await DBProvider().getInfo(_toDoList, ToDoList, TODOLIST);
  }

  fetchData() async {
    var count = await DBProvider().getcount();
    print("count $count");
    var count1 = await DBProvider().getTodcount();
    print("counttodo $count1");
    count == 0 ? await fetchApi() : await fetchDatabase();
  }

  //shuffle post list

  List shuffle(List items) {
    var random = new Random();

    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);

      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }

  Future<void> userDataFetch() async {
    print("length ${_userInfo.length}");
    print("fetching from api");
    try {
      final respose = await http.get(url("users"));
      final extractedData = json.decode(respose.body);
      final List<UsersInfo> loadedDetails = [];

      extractedData.forEach((data) {
        var usersInfo = UsersInfo(
          id: data["id"],
          name: data["name"],
          email: data["email"],
          username: data["username"],
          phone: data["phone"],
          website: data["website"],
          street: data["address"]["street"],
          suite: data["address"]["suite"],
          city: data["address"]["city"],
          zipcode: data["address"]["zipcode"],
          companyName: data["company"]["name"],
          catchPhrase: data["company"]["catchPhrase"],
          bs: data["company"]["bs"],
          lat: data["address"]["geo"]["lat"],
          lng: data["address"]["geo"]["lng"],
        );
        loadedDetails.add(usersInfo);
        DBProvider().saveUserInfo(usersInfo);
      });
      _userInfo = loadedDetails;
      print("userinfo Done");
      notifyListeners();
      print("Length of user ${userInfo.length}");
    } catch (e) {
      print(e);
    }
  }

  Future postDetailData() async {
    try {
      final List<PostDetails> loadedPostDetails = []; //
      for (int i = 0; i < _userInfo.length; i++) {
        var userId = _userInfo[i].id;

        final response = await http.get(url("users/$userId/posts"));
        final extractedData = json.decode(response.body);

        extractedData.forEach((data) {
          var postDetails = PostDetails(
              id: data["id"],
              userId: data["userId"],
              title: data["title"],
              body: data["body"]);
          loadedPostDetails.add(postDetails);
          DBProvider().savePostDetail(postDetails);
        });
      }
      var shuffledList = shuffle(loadedPostDetails);
      _postDetails = shuffledList;

      notifyListeners();
    } catch (e) {
      print(e);
    }

    print('is of post details${_postDetails[9].id}');
    print("post Done");
  }

  Future postCommentsData() async {
    try {
      final List<PostComments> loadedPostComments = []; //
      for (int i = 0; i < _postDetails.length; i++) {
        var postDetailId = _postDetails[i].id;
        print(i);
        final response = await http.get(url("posts/$postDetailId/comments"));
        final extractedData = json.decode(response.body);

        extractedData.forEach((data) {
          var postComments = PostComments(
            id: data["id"],
            postId: data["postId"],
            name: data["name"],
            phone: data["phone"],
            email: data["email"],
            body: data["body"],
          );
          loadedPostComments.add(postComments);
          DBProvider().savePostComment(postComments);
        });
      }

      _postComments = loadedPostComments;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future albumData() async {
    final List<Albums> loadedAlbums = []; //
    for (int i = 0; i < _userInfo.length; i++) {
      var userId = _userInfo[i].id;

      final response = await http.get(url("users/$userId/albums"));
      final extractedData = json.decode(response.body);
      extractedData.forEach((data) {
        var albums = Albums(
          id: data["id"],
          title: data["title"],
          userId: data["userId"],
        );
        loadedAlbums.add(albums);
        DBProvider().saveAlbum(albums);
      });
    }
    _album = loadedAlbums;
    print("album done");
    notifyListeners();
  }

  Future photoData() async {
    print("album");
    final List<Photo> loadedPhoto = []; //
    for (int i = 0; i < _album.length; i++) {
      var albumId = _album[i].id;

      final response = await http.get(url("albums/$albumId/photos"));
      final extractedData = json.decode(response.body);
      extractedData.forEach((data) {
        print(data);
        var photo = Photo(
            id: data["id"],
            albumId: data["albumId"],
            title: data["title"],
            url: data["url"],
            thumbnailUrl: data["thumbnailUrl"]);
        loadedPhoto.add(photo);
        DBProvider().savePhoto(photo);
      });
    }
    _photo = loadedPhoto;
    print('is of photoes${_photo[99].title}');
    notifyListeners();
  }

Future<List<UsersInfo>> search () async {



  }


}
