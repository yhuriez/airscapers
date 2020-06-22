import 'package:airscaper/model/entities/element_description.dart';
import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/usecases/inventory_use_cases.dart';
import 'package:airscaper/views/inventory/inventory_details_screen.dart';
import 'package:airscaper/views/navigation/navigation_intent.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';

class InventoryItemsScreen extends StatelessWidget {
  static const routeName = "/items";

  final _loadItemsUseCase = sl<LoadItemsUseCase>();

  static NavigationIntent navigate(bool isWithResult) =>
      NavigationIntent(routeName, isWithResult);

  @override
  Widget build(BuildContext context) {

    bool isWithResult = ModalRoute.of(context).settings.arguments ?? false;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text("Inventaire"),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true),
      body: FutureBuilder<List<ScenarioItem>>(
          future: _loadItemsUseCase.execute(),
          builder: (context, snapshot) {
            final items = snapshot.data ?? [];
            return InventoryItemGrid(
              items: items,
              onItemClicked: (context, item) {
                onItemClicked(context, item, isWithResult);
              },
            );
          }),
    );
  }

  onItemClicked(BuildContext context, ScenarioItem item, bool isWithResult) {
    if (isWithResult) {
      Navigator.of(context).pop(item);
    } else {
      final desc = ScenarioElementDesc.fromItem(item, found: true);
      Navigator.of(context)
          .pushNamed(InventoryDetailsScreen.routeName, arguments: desc);
    }
  }
}

class InventoryItemGrid extends StatelessWidget {
  final List<ScenarioItem> items;
  final Function(BuildContext, ScenarioItem) onItemClicked;

  const InventoryItemGrid(
      {Key key, @required this.items, @required this.onItemClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 8.0),
          delegate: SliverChildListDelegate(
              items.map((it) => createItem(context, it)).toList()),
        )
      ],
    );
  }

  Widget createItem(BuildContext context, ScenarioItem item) {
    return InkWell(
      onTap: () {
        onItemClicked(context, item);
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            (item.image == null)
                ? Container()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        SizedBox(height: 120, child: Image.asset(item.image)),
                  ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(item.title, style: TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}
