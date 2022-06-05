import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dataProvider.dart';
import '../Screen/PhotosScreen.dart';
import '../Widgets/mainUiWidget.dart';

class AlbumsScreen extends StatelessWidget {
  static const routeName = '/albumScreen';
  final int userId;
  const AlbumsScreen({this.userId});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final albumList = Provider.of<DataProvider>(context).album;

    final AlbumsScreen args = ModalRoute.of(context).settings.arguments;
    final filteredAlbumList =
        albumList.where((album) => album.userId == args.userId).toList();
    return SafeArea(
      child: Scaffold(
        body: buildMainUi(
          context: context,
          heading: "Albums",
          padding: const EdgeInsets.only(left: 68.0, top: 40, bottom: 20),
          body: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 15.0,
            ),
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int i) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: (InkWell(
                        onTap: () => Navigator.of(context)
                            .pushNamed(PhotoScreen.routeName,
                                arguments: PhotoScreen(
                                  albumId: filteredAlbumList[i].id,
                                )),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: screenSize.height * 0.20,
                          width: screenSize.height * 0.24,
                          margin: const EdgeInsets.all(2),
                          child: Center(
                            child: Text(
                              filteredAlbumList[i].title,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: screenSize.height * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )),
                    ),
                childCount: filteredAlbumList.length),
          ),
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Albums"),
    //     centerTitle: true,
    //   ),
    //   body: Container(
    //     color: Theme.of(context).primaryColor,
    //     child: GridView.builder(
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           crossAxisSpacing: 4.0,
    //           mainAxisSpacing: 4.0,
    //         ),
    //         itemCount: 12,
    //         itemBuilder: (ctx, i) => Container(
    //               color: Colors.white,
    //               child: Text("Hello $i"),
    //             )),
    //   ),
    // );
  }
}
