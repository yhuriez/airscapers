
import 'package:airscaper/common/colors.dart';
import 'package:airscaper/views/common/ars_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


class ImageDetailsScreen extends StatelessWidget {

  static const imageTag = "imageTag";

  final String assetPath;
  final String title;

  const ImageDetailsScreen({Key key, this.title, this.assetPath}) : super(key: key);


  static Route<dynamic> createRoute(String title, String assetPath) {
    return MaterialPageRoute(builder: (context) => ImageDetailsScreen(title: title, assetPath: assetPath));
  }

  @override
  Widget build(BuildContext context) {
    return ARSScaffold(
      title: title,
      child: Container(
        color: backgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: imageTag,
              child: AspectRatio(
                aspectRatio: 1,
                child: PhotoView(
                  imageProvider: AssetImage(assetPath),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}