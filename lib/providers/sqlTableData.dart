const String DB_NAME = "BLOGS";

const String USERTABLE = "UserInfo";
const String POSTTABLE = "POSTDETAILS";
const String COMMENTTABLE = "POSTCOMMENTS";
const String ALBUMTABLE = "ALBUMS";
const String PHOTOTABLE = "PHOTO";
const String TODOLIST = "TODOLIST";

const String ID = "id";
const String NAME = "name";
const String USERNAME = "username";
const String EMAIL = "email";
const String PHONE = "phone";
const String WEBSITE = "website";
const String STREET = "street";
const String SUITE = "suite";
const String CITY = "city";
const String ZIPCODE = "zipcode";
const String LAT = "lat";
const String LNG = "lng";
const String COMPANYNAME = "companyName";
const String CATCH = "catchPhrase";
const String BS = "bs";
const String POSTID = "postId";
const String ALBUMID = "albumId";
const String USERID = "userId";
const String TITLE = "title";
const String BODY = "body";
const String URL = "url";
const String THUMURL = "thumbnailUrl";

const List<String> UsersList = [
  ID,
  NAME,
  EMAIL,
  PHONE,
  WEBSITE,
  USERNAME,
  WEBSITE,
  STREET,
  SUITE,
  CITY,
  ZIPCODE,
  LAT,
  LNG,
  COMPANYNAME,
  CATCH,
  BS
];

const List<String> PostList = [ID, USERID, TITLE, BODY];
const List<String> PostCommentsList = [ID, POSTID, NAME, BODY, EMAIL];
const List<String> AlbumList = [ID, USERID, TITLE];
const List<String> PHOTOList = [ID, ALBUMID, TITLE, URL, THUMURL];
const List<String> ToDoList = [ID, TITLE];
