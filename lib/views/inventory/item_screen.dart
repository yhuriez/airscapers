import 'package:airscaper/models/scenario_item.dart';
import 'package:airscaper/views/common/ars_scaffold.dart';
import 'package:airscaper/views/common/nfc_write_dialog.dart';
import 'package:airscaper/views/inventory/ars_details_box.dart';
import 'package:airscaper/views/mechanism/interactions/continue_button_view.dart';
import 'package:airscaper/views/navigation/fade_page_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InventoryDetailsFragment extends StatelessWidget {
  static const routeName = "/details";

  final ScenarioItem item;

  static Route route(ScenarioItem item) {
    return FadeBlackPageRoute(
        builder: (_) => InventoryDetailsFragment(item: item),
        settings: const RouteSettings(name: routeName));
  }

  const InventoryDetailsFragment({Key? key, required this.item}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ARSScaffold(
        title: item.title,
        actions: [
          if(kDebugMode) IconButton(
              onPressed: () => onDisplayWriteNfcDialog(context),
              icon: Icon(Icons.nfc, color: Colors.white,)
          )
        ],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ScenarioElementView(item: item),
        ));
  }

  onDisplayWriteNfcDialog(BuildContext context) {
    showDialog(context: context, builder: (_) => NfcWriteDialog(link: "airscapers://item/${item.id}"));
  }
}

class ScenarioElementView extends StatefulWidget {

  final ScenarioItem item;

  ScenarioElementView({Key? key, required this.item}) : super(key: key);

  @override
  _ScenarioElementViewState createState() => _ScenarioElementViewState();
}

class _ScenarioElementViewState extends State<ScenarioElementView> {

  @override
  Widget build(BuildContext context) {

    String description = widget.item.description;

    return ARSDetailsBox(
      interactionsBuilder: (ctx) => ContinueButtonView(),
      imageUrl: widget.item.image,
      description: description,
      name: widget.item.title
    );
  }
}

