import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewScreen extends StatelessWidget {
  static const routeName = "/photoView";
  final String text;
  final String url;

  const PhotoViewScreen({Key key, this.text, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PhotoViewScreen args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.text),
      ),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(args.url),
        ),
      ),
    );
  }
}
