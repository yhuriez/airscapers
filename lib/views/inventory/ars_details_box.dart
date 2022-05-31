import 'package:airscaper/models/scenario_item.dart';
import 'package:airscaper/views/common/ars_drag_target.dart';
import 'package:airscaper/views/common/ars_inner_shadow.dart';
import 'package:airscaper/views/common/ars_white_shadow.dart';
import 'package:airscaper/views/inventory/image_details_screen.dart';
import 'package:flutter/material.dart';

class ARSDetailsBox extends StatelessWidget {
  final Widget Function(BuildContext) interactionsBuilder;

  final Function(BuildContext, ScenarioItem)? onAcceptedDropData;

  final String imageUrl;
  final String description;
  final String name;

  const ARSDetailsBox(
      {Key? key,
      required this.interactionsBuilder,
      required this.imageUrl,
      required this.description,
      required this.name,
      this.onAcceptedDropData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        // Image
        Expanded(child: _createImageDragTarget(context)),

        // Item box
        _createItemBox(context)
      ],
    );
  }

  Widget _createImage(BuildContext context, {bool incomingState = false}) {
    final image = SizedBox.expand(
      child: Hero(
        tag: ImageDetailsScreen.imageTag,
        child: Image.asset(
            this.imageUrl,
            fit: BoxFit.fill,
          ),
        ),
    );

    return AspectRatio(
      aspectRatio: 1,
      child: InkWell(
        onTap: () => _onImageClicked(context),
        child: (imageUrl.contains("transparent"))
            ? image
            : ARSInnerShadow(
                key: LabeledGlobalKey("innershadow_$incomingState"),
                color: (incomingState) ? Colors.white : Colors.black,
                offset: Offset(20, 20),
                child: image,
              ),
      ),
    );
  }

  Widget _createImageDragTarget(BuildContext context) {
    // No drag target if not configured
    if (onAcceptedDropData == null) return _createImage(context);

    return ARSDragTarget<ScenarioItem>(
      targetBuilder: (context, incoming, rejected) {
        print("Incoming = $incoming");
        return _createImage(context, incomingState: incoming.isNotEmpty);
      },
      acceptedData: onAcceptedDropData
    );
  }

  Widget _createItemBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: ARSShadowBox(
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

  _onImageClicked(BuildContext context) {
    Navigator.of(context, rootNavigator: true)
        .push(ImageDetailsScreen.createRoute(this.name, this.imageUrl));
  }
}
