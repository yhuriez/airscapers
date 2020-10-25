import 'package:airscaper/model/entities/element_description.dart';
import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/usecases/link_use_cases.dart';
import 'package:airscaper/views/common/ars_scaffold.dart';
import 'package:airscaper/views/home/bloc/inventory/inventory_events.dart';
import 'package:airscaper/views/items/interactions/interaction_factory.dart';
import 'package:airscaper/views/navigation/navigation_intent.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';
import 'package:airscaper/common/extensions.dart';

import '../../injection.dart';
import 'ars_details_box.dart';

class ItemDetailsFragment extends StatelessWidget {
  static const routeName = "/details";

  InterpretLinkUseCase get _interpretLinkUseCase => sl();

  const ItemDetailsFragment({Key key}) : super(key: key);

  static NavigationIntent navigate(ScenarioElementDesc desc) =>
      NavigationIntent(routeName, desc);

  @override
  Widget build(BuildContext context) {
    ScenarioElementDesc desc = ModalRoute.of(context).settings.arguments;
    ScenarioItem item = desc.item;

    return ARSScaffold(
        title: desc.item.title,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ARSDetailsBox(
              interactionsBuilder: (context) =>
                  _createInteraction(context, item),
              imageUrl: item.image,
              description:
                  (desc.found) ? item.description : item.foundDescription ?? item.description,
              name: item.title),
        ));
  }

  Widget _createInteraction(BuildContext context, ScenarioItem item) =>
      createInteractionWidget(
          context.inventoryBloc.state, item, onInteractionResolved);

  onInteractionResolved(BuildContext context, int itemId) async {
    context.inventoryBloc.add(ResolveItemInventoryEvent(itemId));
    final intent = await _interpretLinkUseCase.execute(context, itemId);
    navigateTo(context, intent);
  }
}
