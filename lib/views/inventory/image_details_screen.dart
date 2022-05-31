import 'package:airscaper/common/colors.dart';
import 'package:airscaper/views/common/ars_scaffold.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


class ImageDetailsScreen extends StatelessWidget {

  static const imageTag = "imageTag";

  final String assetPath;
  final String title;

  const ImageDetailsScreen({
    Key? key,
    required this.title,
    required this.assetPath
  }) : super(key: key);

  static Route<dynamic> createRoute(String title, String assetPath) {
    return createFadeRoute(
        ImageDetailsScreen(title: title, assetPath: assetPath), "");
  }

  @override
  Widget build(BuildContext context) {
    return ARSScaffold(
      title: title,
      child: Container(
        color: backgroundColor,
        constraints: BoxConstraints.expand(
          height: MediaQuery
              .of(context)
              .size
              .height,
        ),
        child: PhotoView(
          imageProvider: AssetImage(assetPath),
          heroAttributes: const PhotoViewHeroAttributes(tag: imageTag),
        ),
      ),
    );
  }
}