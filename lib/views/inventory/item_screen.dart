import 'package:airscaper/domain/usecases/inventory_use_cases.dart';
import 'package:airscaper/domain/usecases/link_use_cases.dart';
import 'package:airscaper/models/scenario_item.dart';
import 'package:airscaper/models/scenario_loot.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_dialog_base.dart';
import 'package:airscaper/views/common/ars_scaffold.dart';
import 'package:airscaper/views/common/nfc_write_dialog.dart';
import 'package:airscaper/views/inventory/ars_details_box.dart';
import 'package:airscaper/views/navigation/fade_page_route.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';

class InventoryDetailsFragment extends StatelessWidget {
  static const routeName = "/details";

  final ScenarioItem item;
  final bool found;

  static Route route(ScenarioItem item, {bool found = false}) {
    return FadeBlackPageRoute(
        builder: (_) => InventoryDetailsFragment(item: item, found: found),
        settings: const RouteSettings(name: routeName));
  }

  const InventoryDetailsFragment({Key? key, required this.item, this.found = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ARSScaffold(
        title: item.title,
        actions: [
          if (kDebugMode)
            IconButton(
                onPressed: () => onDisplayWriteNfcDialog(context),
                icon: Icon(
                  Icons.nfc,
                  color: Colors.white,
                ))
        ],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ScenarioElementView(
            item: item,
            found: found,
          ),
        ));
  }

  onDisplayWriteNfcDialog(BuildContext context) {
    showDialog(
        context: context, builder: (_) => NfcWriteDialog(link: "airscapers://item/${item.id}"));
  }
}

class ScenarioElementView extends StatefulWidget {
  final ScenarioItem item;
  final bool found;

  FilterAvailableLootUseCase get _filterAvailableLootUseCase => sl();

  InterpretLinkUseCase get _interpretLinkUseCase => sl();

  ScenarioElementView({Key? key, required this.item, required this.found}) : super(key: key);

  @override
  _ScenarioElementViewState createState() => _ScenarioElementViewState();
}

class _ScenarioElementViewState extends State<ScenarioElementView> {
  late List<ScenarioLoot> availableLoots;

  @override
  void initState() {
    super.initState();
    availableLoots = widget.item.loots;
    _refreshLoots();
  }

  @override
  Widget build(BuildContext context) {
    String description = widget.item.description;
    if (widget.item.foundDescription != null && (widget.found || availableLoots.isNotEmpty)) {
      description = widget.item.foundDescription!;
    }

    return ARSDetailsBox(
        interactionsBuilder: _createInteraction,
        imageUrl: widget.item.image,
        description: description,
        name: widget.item.title);
  }

  Widget _createInteraction(BuildContext context) =>
      (availableLoots.isNotEmpty) ? _searchButton : _continueButton;

  Widget get _continueButton => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ARSButton(
          key: const Key("details_continue_button"),
          onClick: _onContinueButtonClicked,
          text: Text(
            "Continuer",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );

  _onContinueButtonClicked(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget get _searchButton => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ARSButton(
          key: const Key("details_search_button"),
          onClick: (context) => _onSearchClicked(context),
          text: Text(
            (availableLoots.length == 1)
                ? availableLoots.first.interactionText ?? "Fouiller"
                : "Fouiller",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );

  _onSearchClicked(BuildContext context) {
    final loots = widget._filterAvailableLootUseCase.execute(availableLoots);

    if (widget.item.loots.length > 1) {
      showDialog(
          context: context,
          barrierDismissible: true,
          barrierColor: Colors.black45,
          builder: (context) => SearchContent(
                loots: loots,
                onLootClicked: (loot) {
                  Navigator.of(context, rootNavigator: true).pop();
                  _onLootClicked(loot);
                },
              ));
    } else {
      // If only one loot, directly go to this one
      _onLootClicked(loots.first);
    }
  }

  _onLootClicked(ScenarioLoot loot) async {
    final intent = widget._interpretLinkUseCase.execute(loot);

    await navigateTo(context, intent);

    _refreshLoots(exitOnEmpty: true);
  }

  _refreshLoots({bool exitOnEmpty = false}) {
    final newLoots = widget._filterAvailableLootUseCase.execute(availableLoots);

    setState(() {
      availableLoots = newLoots;
    });
  }
}

class SearchContent extends StatelessWidget {
  final List<ScenarioLoot> loots;
  final Function(ScenarioLoot) onLootClicked;

  const SearchContent({Key? key, required this.loots, required this.onLootClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ARSDialogBase(
        child: Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: loots
              .where((it) => it.interactionText != null)
              .mapIndexed((index, loot) => _LootButton(
                    key: Key("search_item_button_$index"),
                    loot: loot,
                    onLootClicked: onLootClicked,
                  ))
              .toList()),
    ));
  }
}

class _LootButton extends StatelessWidget {
  final ScenarioLoot loot;
  final Function(ScenarioLoot) onLootClicked;

  const _LootButton({Key? key, required this.loot, required this.onLootClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ARSButton(
          onClick: (context) => onLootClicked(loot),
          text: Text(
            loot.interactionText ?? "",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green),
    );
  }
}
