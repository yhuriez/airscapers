import 'package:airscaper/domain/usecases/inventory/filter_available_loots_use_case.dart';
import 'package:airscaper/domain/usecases/link/interpret_link_use_case.dart';
import 'package:airscaper/injection.dart';
import 'package:airscaper/models/mechanism_solving.dart';
import 'package:airscaper/models/scenario_loot.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_dialog_base.dart';
import 'package:airscaper/views/mechanism/interactions/continue_button_view.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatefulWidget {
  FilterAvailableLootUseCase get _filterAvailableLootUseCase => sl();

  InterpretLinkUseCase get _interpretLinkUseCase => sl();

  final MechanismSolvingSearch _solving;

  const SearchButton(this._solving, {Key? key}) : super(key: key);

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  List<ScenarioLoot> availableLoots = [];

  @override
  void initState() {
    super.initState();
    availableLoots = widget._solving.loots;
  }

  @override
  Widget build(BuildContext context) {
    if(availableLoots.length == 0) {
      return ContinueButtonView();
    }

    return Padding(
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
  }

  _onSearchClicked(BuildContext context) {
    final loots = widget._filterAvailableLootUseCase.execute(availableLoots);

    if (widget._solving.loots.length > 1) {
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
    final intent = widget._interpretLinkUseCase.execute(loot.id);

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
                    loot,
                    index: index,
                    onLootClicked: onLootClicked,
                  ))
              .toList()),
    ));
  }
}

class _LootButton extends StatelessWidget {
  final int index;
  final ScenarioLoot _loot;
  final Function(ScenarioLoot) onLootClicked;

  const _LootButton(this._loot, {Key? key, required this.onLootClicked, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ARSButton(
          key: ValueKey("search_item_button_$index"),
          onClick: (context) => onLootClicked(_loot),
          text: Text(
            _loot.interactionText ?? "",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green),
    );
  }
}
