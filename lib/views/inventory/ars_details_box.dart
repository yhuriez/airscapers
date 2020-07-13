import 'package:airscaper/views/common/ars_inner_shadow.dart';
import 'package:airscaper/views/common/ars_white_shadow.dart';
import 'package:flutter/material.dart';

class ARSDetailsBox extends StatelessWidget {
  final Widget Function(BuildContext, Widget) imageContainerBuilder;
  final Widget Function(BuildContext) interactionsBuilder;

  final String imageUrl;
  final String description;

  const ARSDetailsBox(
      {Key key,
      this.imageContainerBuilder,
      this.interactionsBuilder,
      this.imageUrl,
      this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        // Image
        (this.imageUrl == null)
            ? Container()
            : Expanded(
                child: imageContainerBuilder(context, _createImage(context))),

        // Item box
        _createItemBox(context)
      ],
    );
  }

  Widget _createImage(BuildContext context) => AspectRatio(
    aspectRatio: 1,
    child: ARSInnerShadow(
          color: Colors.black,
          offset: Offset(20, 20),
          child: SizedBox.expand(
            child: Image.asset(
              this.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
  );

  Widget _createItemBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: ARSWhiteShadow(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text description
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: _createText(context),
            ),
            // Interaction
            this.interactionsBuilder(context)
          ],
        ),
      ),
    );
  }

  Widget _createText(BuildContext context) => Center(
        child: Text(this.description,
            style: TextStyle(fontSize: 16, color: Colors.black)),
      );
}
