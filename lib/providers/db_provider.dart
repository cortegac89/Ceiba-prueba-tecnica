import 'dart:async';
import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../Model/toDoList.dart';

import '../Model/albums.dart';
import '../Model/photos.dart';
import '../Model/post.dart';
import '../Model/users.dart';
import '../providers/sqlTableData.dart';

class DBProvider {
  Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initDb();
    return _db;
  }

  _onCreate(Database db, int ver) async {
    await db.execute(
        "CREATE TABLE USERINFO($ID PRIMARY KEY, $NAME TEXT,$EMAIL TEXT, $PHONE TEXT,$USERNAME TEXT,$WEBSITE TEXT,$STREET TEXT,$SUITE TEXT,$CITY TEXT,$ZIPCODE TEXT,$LAT TEXT,$LNG TEXT, $COMPANYNAME TEXT,$CATCH TEXT, $BS TEXT)");
    await db.execute(
        "CREATE TABLE POSTDETAILS($ID PRIMARY KEY, $USERID INT,$TITLE TEXT, $BODY TEXT)");
    await db.execute(
        "CREATE TABLE POSTCOMMENTS($ID PRIMARY KEY, $POSTID INT,$NAME TEXT, $BODY TEXT,$EMAIL TEXT)");
    await db.execute(
        "CREATE TABLE ALBUMS($ID PRIMARY KEY, $USERID INT,$TITLE TEXT)");
    await db.execute(
        "CREATE TABLE PHOTO($ID PRIMARY KEY, $ALBUMID INT,$TITLE TEXT, $URL TEXT, $THUMURL TEXT)");
    await db.execute(
        "CREATE TABLE TODOLIST($ID AUTO_INCREMENT PRIMARY KEY, $TITLE TEXT)");
  }

  initDb() async {
    io.Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = join(docDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  Future<int> getcount() async {
    var dbclient = await db;
    int count = Sqflite.firstIntValue(
        await dbclient.rawQuery("SELECT COUNT(*) FROM $COMMENTTABLE"));
    return count;
  }

  Future<int> getTodcount() async {
    var dbclient = await db;
    int count = Sqflite.firstIntValue(
        await dbclient.rawQuery("SELECT COUNT(*) FROM $TODOLIST"));
    return count;
  }

  Future<UsersInfo> saveUserInfo(UsersInfo usersInfo) async {
    print("user info saved in db");
    var dbClient = await db;
    usersInfo.id = await dbClient.insert(USERTABLE, usersInfo.toMap());
    print(usersInfo);
    return usersInfo;
  }

  Future<PostDetails> savePostDetail(PostDetails postDetails) async {
    print("PostDetails saved in db");
    var dbClient = await db;
    postDetails.id = await dbClient.insert(POSTTABLE, postDetails.toMap());
    return postDetails;
  }

  Future<PostComments> savePostComment(PostComments postComments) async {
    print("Post comments saved in db");
    var dbClient = await db;
    postComments.id = await dbClient.insert(COMMENTTABLE, postComments.toMap());
    return postComments;
  }

  Future<Albums> saveAlbum(Albums albums) async {
    print("Album saved in db");
    var dbClient = await db;
    albums.id = await dbClient.insert(ALBUMTABLE, albums.toMap());
    return albums;
  }

  Future<Photo> savePhoto(Photo photo) async {
    print("Photoes saved in db");
    var dbClient = await db;
    photo.id = await dbClient.insert(PHOTOTABLE, photo.toMap());
    return photo;
  }

  Future<ToDolist> saveToDoList(ToDolist toDolist) async {
    print("ToDo list saved in db");
    var dbClient = await db;
    toDolist.id = await dbClient.insert(TODOLIST, toDolist.toMap());
    return toDolist;
  }

  Future<void> getInfo(List userInfo, List column, String tableName) async {
    var dbClient = await db;
    print("fetching from database");
    List<Map> maps = await dbClient.query(tableName, columns: column);

    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        tableName == USERTABLE
            ? userInfo.add(UsersInfo.fromMap(maps[i]))
            : tableName == POSTTABLE
                ? userInfo.add(PostDetails.fromMap(maps[i]))
                : tableName == COMMENTTABLE
                    ? userInfo.add(PostComments.fromMap(maps[i]))
                    : tableName == ALBUMTABLE
                        ? userInfo.add(Albums.fromMap(maps[i]))
                        : tableName == PHOTOTABLE
                            ? userInfo.add(Photo.fromMap(maps[i]))
                            : userInfo.add(ToDolist.fromMap(maps[i]));
      }
    } else {
      print("no data");
    }
  }

  Future<UsersInfo> save(
      {String tableName,
      UsersInfo usersInfo,
      PostDetails postDetails,
      PostComments postComments,
      Albums albums,
      Photo photo}) async {
    print("object");
    var dbClient = await db;
    usersInfo.id = await dbClient.insert(tableName, usersInfo.toMap());
    print(usersInfo);
    return usersInfo;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TODOLIST, where: '$ID = ?', whereArgs: [id]);
  }

// Future<int> update(UsersInfo usersInfo) async {
//   var dbClient = await db;
//   return await dbClient.update(TABLEUSERINFO, usersInfo.toMap(),
//       where: '$ID=?', whereArgs: [usersInfo.id]);
// }

  Future close(Future<Database> db) async {
    var dbClient = await db;
    dbClient.close();
  }
}
