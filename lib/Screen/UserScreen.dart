import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dataProvider.dart';
import '../Widgets/Post/buildPost.dart';
import '../Widgets/buildFlexibleSpaceBar.dart';

class UserScreen extends StatefulWidget {
  static const routeName = '/user';
  final userInfo;
  final int id;

  const UserScreen({Key key, this.userInfo, this.id}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final Color color = Theme.of(context).primaryColor;
    // final UserScreen widget = ModalRoute.of(context).settings.arguments;
    final postDetail = Provider.of<DataProvider>(context).postDetails;
    final filteredPost =
        postDetail.where((post) => post.userId == widget.userInfo.id).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.userInfo.name,
          style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.height * 0.03,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: Colors.grey,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              forceElevated: true,
              elevation: 0,
              expandedHeight: screenSize.height * 0.45,
              centerTitle: true,
              leading: Container(), // to remove back button
              flexibleSpace: buildFlexibleSpaceBar(
                widget.id,
                color,
                context,
                screenSize,
                widget.userInfo,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, i) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 5),
                        child: buildPost(
                            context: context,
                            name: widget.userInfo.name,
                            phone: widget.userInfo.phone,
                            email: widget.userInfo.email,
                            body: filteredPost[i].body,
                            title: filteredPost[i].title,
                            color: color,
                            screenSize: screenSize,
                            postID: filteredPost[i].id,
                            id: widget.userInfo.id),
                      ),
                  childCount: filteredPost.length),
            ),
          ],
        ),
      ),
    );
  }
}
