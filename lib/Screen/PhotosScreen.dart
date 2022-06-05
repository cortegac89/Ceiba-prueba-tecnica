import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../Screen/PhotoView.dart';

import '../providers/dataProvider.dart';
import '../Widgets/mainUiWidget.dart';

class PhotoScreen extends StatelessWidget {
  static const routeName = "/photo";
  final int albumId;

  const PhotoScreen({Key key, this.albumId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final PhotoScreen args = ModalRoute.of(context).settings.arguments;
    final photoList = Provider.of<DataProvider>(context).photo;
    final filteredPhotoList =
        photoList.where((photo) => photo.albumId == args.albumId).toList();
    return SafeArea(
      child: Scaffold(
        body: buildMainUi(
          heading: "Photo",
          context: context,
          padding: const EdgeInsets.only(left: 68.0, top: 40, bottom: 20),
          body: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int i) => photoList.length == 0
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey[400],
                        highlightColor: Colors.white,
                        child: Container(
                          color: Colors.white,
                          height: screenSize.height * 0.10,
                          width: screenSize.height * 0.14,
                          margin: const EdgeInsets.all(2),
                        ),
                      )
                    : InkWell(
                        onTap: () => Navigator.of(context)
                            .pushNamed(PhotoViewScreen.routeName,
                                arguments: PhotoViewScreen(
                                  text: filteredPhotoList[i].title,
                                  url: filteredPhotoList[i].url,
                                )),
                        child: Container(
                          height: screenSize.height * 0.10,
                          width: screenSize.height * 0.14,
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: NetworkImage(
                                    filteredPhotoList[i].thumbnailUrl),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                childCount: filteredPhotoList.length),
          ),
        ),
      ),
    );
  }
}
