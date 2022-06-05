import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../providers/dataProvider.dart';
import '../Post/usersPostWidgets.dart';

class CommentsSection extends StatefulWidget {
  final int id;

  const CommentsSection({Key key, this.id}) : super(key: key);
  @override
  _CommentsSectionState createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final commentData = Provider.of<DataProvider>(context).postComments;
    final filteredComments =
        commentData.where((data) => data.postId == widget.id).toList();
    final postData = Provider.of<DataProvider>(context).postDetails;

    return Container(
      child: ExpansionTile(
        title: Text("Comments"),
        children: [
          Container(
            height: screenSize.height * 0.5,
            child: commentData.length == 0
                ? Container(
                    height: screenSize.height * 0.5,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => Shimmer.fromColors(
                        baseColor: Colors.grey[400],
                        highlightColor: Colors.white,
                        child: ListItem(),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredComments.length,
                    itemBuilder: (BuildContext context, i) => Column(
                      children: [
                        buildComments(
                            context,
                            screenSize,
                            Theme.of(context).primaryColor,
                            filteredComments[i].name,
                            filteredComments[i].phone,
                            filteredComments[i].email,
                            filteredComments[i].body,
                            postData[i].id),
                        Divider()
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

Widget buildComments(BuildContext context, Size screenSize, Color color,
    String name, String phone, String email, String comments, int id) {
  return Container(
    child: Column(
      children: [
        userDetails(context, screenSize, color, screenSize.height * 0.025,
            screenSize.height * 0.020, name, phone, email, id),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              comments,
            ),
          ),
        )
      ],
    ),
  );
}

class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
        height: screenSize.height * 0.06,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Expanded(
          child: Container(
            color: Colors.grey,
          ),
        ));
  }
}
