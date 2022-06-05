import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dataProvider.dart';
import '../Widgets/mainUiWidget.dart';
import '../Widgets/Post/buildPost.dart';

class PostsScreen extends StatefulWidget {
  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    final screenSize = MediaQuery.of(context).size;
    final userData = Provider.of<DataProvider>(context).userInfo;
    final postData = Provider.of<DataProvider>(context).postDetails;

    return buildMainUi(
      context: context,
      body: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
            child: buildPost(
                context: context,
                screenSize: screenSize,
                color: color,
                name: userData[postData[i].userId - 1].name,
                phone: userData[postData[i].userId - 1].phone,
                email: userData[postData[i].userId - 1].email,
                title: postData[i].title,
                body: postData[i].body,
                postID: postData[i].id,
                id: userData[postData[i].userId - 1].id),
          ),
          childCount: postData.length,
        ),
      ),
      heading: "Posts",
      padding: const EdgeInsets.only(left: 18.0, top: 40, bottom: 20),
    );
  }
}
