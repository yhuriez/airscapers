import 'package:airscaper/model/entities/element_description.dart';
import 'package:airscaper/model/entities/scenario_loot.dart';
import 'package:airscaper/usecases/inventory_use_cases.dart';
import 'package:airscaper/usecases/link_use_cases.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_dialog_base.dart';
import 'package:airscaper/views/common/ars_scaffold.dart';
import 'package:airscaper/views/inventory/ars_details_box.dart';
import 'package:airscaper/views/navigation/navigation_intent.dart';
import 'package:airscaper/views/navigation/navigation_link.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';

class InventoryDetailsFragment extends StatelessWidget {
  static const routeName = "/details";

  final ScenarioElementDesc desc;

  const InventoryDetailsFragment({Key key, this.desc}) : super(key: key);

  static NavigationIntent navigate(ScenarioElementDesc desc) =>
      NavigationIntent(routeName, desc);

  @override
  Widget build(BuildContext context) {
    ScenarioElementDesc desc = ModalRoute.of(context).settings.arguments;

    return ARSScaffold(
        title: desc.title,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ScenarioElementView(desc: desc),
        ));
  }
}

class ScenarioElementView extends StatefulWidget {
  final ScenarioElementDesc desc;

  FilterAvailableLootUseCase get _filterAvailableLootUseCase => sl();
  InterpretLinkUseCase get _interpretLinkUseCase => sl();

  ScenarioElementView({Key key, this.desc}) : super(key: key);

  @override
  _ScenarioElementViewState createState() => _ScenarioElementViewState();
}

class _ScenarioElementViewState extends State<ScenarioElementView> {
  List<ScenarioLoot> availableLoots;

  @override
  void initState() {
    super.initState();
    availableLoots = widget.desc.loots;
    _refreshLoots();
  }

  @override
  Widget build(BuildContext context) {
    return ARSDetailsBox(
      interactionsBuilder: _createInteraction,
      imageUrl: widget.desc.imageUrl,
      description: widget.desc.description,
      name: widget.desc.title
    );
  }

  Widget _createInteraction(BuildContext context) =>
      (availableLoots != null && availableLoots.isNotEmpty)
          ? _searchButton
          : _continueButton;

  Widget get _continueButton => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ARSButton(
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


  Widget get _searchButton => FutureBuilder<List<ScenarioLoot>>(
      future: widget._filterAvailableLootUseCase.execute(availableLoots),
      builder: (context, snapshot) {
        if (snapshot.data == null) return Container();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ARSButton(
            onClick: (context) => _onSearchClicked(context, snapshot.data),
            text: Text(
              "Fouiller",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ),
        );
      });

  _onSearchClicked(BuildContext context, List<ScenarioLoot> loots) {
    if (widget.desc.loots.length > 1) {
      showDialog(
          context: context,
          barrierDismissible: true,
          barrierColor: Colors.black45,
          child: SearchContent(
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
    final intent = await widget._interpretLinkUseCase
        .execute(context, NavigationLink.fromLoot(loot));
    await Navigator.of(context)
        .pushNamed(intent.screenName, arguments: intent.arguments);

    _refreshLoots(exitOnEmpty: true);
  }

  _refreshLoots({bool exitOnEmpty = false}) async {
    final newLoots =
        await widget._filterAvailableLootUseCase.execute(availableLoots);

    if(exitOnEmpty && newLoots.isEmpty) {
      Navigator.of(context).pop();

    } else {
      setState(() {
        availableLoots = newLoots;
      });
    }
  }
}

class SearchContent extends StatelessWidget {
  final List<ScenarioLoot> loots;
  final Function(ScenarioLoot) onLootClicked;

  const SearchContent({Key key, this.loots, this.onLootClicked})
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
              .map((loot) => _createLootButton(loot))
              .toList()),
    ));
  }

  Widget _createLootButton(ScenarioLoot loot) => Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ARSButton(
            onClick: (context) => onLootClicked(loot),
            text: Text(
              loot.interactionText,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green),
      );
}
