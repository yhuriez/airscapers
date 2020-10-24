import 'package:airscaper/model/entities/element_description.dart';
import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/views/common/ars_scaffold.dart';
import 'package:airscaper/views/items/interactions/interaction_factory.dart';
import 'package:airscaper/views/navigation/navigation_intent.dart';
import 'package:flutter/material.dart';
import 'package:airscaper/common/extensions.dart';

import 'ars_details_box.dart';

class ItemDetailsFragment extends StatelessWidget {
  static const routeName = "/details";

  final ScenarioElementDesc desc;

  const ItemDetailsFragment({Key key, this.desc}) : super(key: key);

  static NavigationIntent navigate(ScenarioElementDesc desc) =>
      NavigationIntent(routeName, desc);

  @override
  Widget build(BuildContext context) {
    ScenarioElementDesc desc = ModalRoute.of(context).settings.arguments;

    return ARSScaffold(
        title: desc.item.title,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ARSDetailsBox(
              interactionsBuilder: _createInteraction,
              imageUrl: item.image,
              description: description,
              name: item.title),
        ));
  }

  ScenarioItem get item => desc.item;

  String get description =>
      (desc.found) ? item.description : item.foundDescription;

  Widget _createInteraction(BuildContext context) => createInteractionWidget(
      context.inventoryBloc.state, item, onInteractionResolved);

  onInteractionResolved(BuildContext context) {

  }
}