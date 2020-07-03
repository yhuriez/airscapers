import 'package:airscaper/model/entities/element_description.dart';
import 'package:airscaper/model/entities/scenario_loot.dart';
import 'package:airscaper/usecases/init_use_cases.dart';
import 'package:airscaper/usecases/inventory_use_cases.dart';
import 'package:airscaper/usecases/link_use_cases.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/home/home_screen.dart';
import 'package:airscaper/views/home/main_scan_fragment.dart';
import 'package:airscaper/views/init/scenario_choose_screen.dart';
import 'package:airscaper/views/navigation/navigation_intent.dart';
import 'package:airscaper/views/navigation/navigation_link.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';

class InventoryDetailsFragment extends StatelessWidget {
  static const routeName = "/details";

  static NavigationIntent navigate(ScenarioElementDesc desc,
          {BackStackBehavior backStackBehavior}) =>
      NavigationIntent(routeName, desc, backStackBehavior: backStackBehavior);

  @override
  Widget build(BuildContext context) {
    ScenarioElementDesc desc = ModalRoute.of(context).settings.arguments;

    return ScenarioElementView(desc: desc);
  }
}

class ScenarioElementView extends StatefulWidget {
  final ScenarioElementDesc desc;

  final FilterAvailableLootUseCase _filterAvailableLootUseCase = sl();
  final InterpretLinkUseCase _interpretLinkUseCase = sl();
  final EndScenarioUseCase _endScenarioUseCase = sl();

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
    refreshLoots();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        (widget.desc.imageUrl == null)
            ? Container()
            : Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(widget.desc.imageUrl),
                ),
              ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child:
                Text(widget.desc.description, style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ),
        (widget.desc.end) ? endButton : Container(),
        (widget.desc.loots != null)
            ? searchButton
            : continueButton,
      ],
    );
  }

  Widget get continueButton => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ARSButton(
          onClick: onContinueButtonClicked,
          text: Text(
            "Continuer",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );

  onContinueButtonClicked(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        MainScanFragment.routeName, (route) => false);
  }

  Widget get endButton => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ARSButton(
          onClick: onEndedClicked,
          text: Text(
            "Fin",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );

  onEndedClicked(BuildContext context) async {
    await widget._endScenarioUseCase.execute();

    Navigator.of(context).pushNamedAndRemoveUntil(
        ChooseScenarioScreen.routeName, (route) => false);
  }

  Widget get searchButton => FutureBuilder<List<ScenarioLoot>>(
      future: widget._filterAvailableLootUseCase.execute(availableLoots),
      builder: (context, snapshot) {

        if (snapshot.data == null) return Container();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ARSButton(
            onClick: (context) => onSearchClicked(context, snapshot.data),
            text: Text(
              "Fouiller",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ),
        );
      });


  onSearchClicked(BuildContext context, List<ScenarioLoot> loots) {
    if(loots.length > 1) {
      showModalBottomSheet(context: context, builder: (bsContext) {

        final lootsButtons = loots
            .where((it) => it.interactionText != null)
            .map((loot) => createLootButton(loot))
            .toList();

        return Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(children: lootsButtons),
        );
      });
    } else {
      // If only one loot, directly go to this one
      onLootClicked(loots.first);
    }
  }

  Widget createLootButton(ScenarioLoot loot) => Padding(
    padding: const EdgeInsets.only(top: 16.0),
    child: ARSButton(
        onClick: (context) => onLootClicked(loot),
        text: Text(
          loot.interactionText,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green),
  );


  onLootClicked(ScenarioLoot loot) async {
    final intent = await widget._interpretLinkUseCase.execute(context, NavigationLink.fromLoot(loot));
    await Navigator.of(context).pushNamed(intent.screenName, arguments: intent.arguments);

    refreshLoots();
  }

  refreshLoots() async {
    final newLoots =
        await widget._filterAvailableLootUseCase.execute(availableLoots);
    setState(() {
      availableLoots = newLoots;
    });
  }
}
