import 'package:airscaper/model/entities/element_description.dart';
import 'package:airscaper/model/entities/scenario_loot.dart';
import 'package:airscaper/usecases/init_use_cases.dart';
import 'package:airscaper/usecases/inventory_use_cases.dart';
import 'package:airscaper/usecases/link_use_cases.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/home/home_scenario_screen.dart';
import 'package:airscaper/views/init/scenario_choose_screen.dart';
import 'package:airscaper/views/navigation/navigation_intent.dart';
import 'package:airscaper/views/navigation/navigation_link.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';

class InventoryDetailsScreen extends StatelessWidget {
  static const routeName = "/details";

  static NavigationIntent navigate(ScenarioElementDesc desc,
      {BackStackBehavior backStackBehavior}) =>
      NavigationIntent(routeName, desc, backStackBehavior: backStackBehavior);

  @override
  Widget build(BuildContext context) {
    ScenarioElementDesc desc = ModalRoute
        .of(context)
        .settings
        .arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(desc.title),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true),
      body: ScenarioElementView(desc: desc),
    );
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
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.desc.imageUrl),
          ),
        ),
        Flexible(
          flex: 3,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child:
              Text(widget.desc.description, style: TextStyle(fontSize: 16)),
            ),
          ),
        ),
        (widget.desc.end) ? endButton : Container(),
        (widget.desc.loots != null && widget.desc.found) ? createLootButtonsGroup() : backButton,
      ],
    );
  }

  Widget get backButton =>
      Flexible(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ARSButton(
            onClick: onBackButtonClicked,
            text: Text("Retour", style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.green,
          ),
        ),
      );

  Widget get endButton =>
      Flexible(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ARSButton(
            onClick: onEndedClicked,
            text: Text("Fin", style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.green,
          ),
        ),
      );

  Widget createLootButtonsGroup() =>
      FutureBuilder<List<ScenarioLoot>>(
        future: widget._filterAvailableLootUseCase.execute(widget.desc.loots),
        builder: (context, snapshot) {
          if(snapshot.data == null) return Container();

          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: createLootButtons(snapshot.data),
              ),
          );
        }
      );

  onBackButtonClicked(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        HomeScenarioScreen.routeName, (route) => false);
  }

  onEndedClicked(BuildContext context) async {

    await widget._endScenarioUseCase.execute();

    Navigator.of(context).pushNamedAndRemoveUntil(
        ChooseScenarioScreen.routeName, (route) => false);
  }

  List<Widget> createLootButtons(List<ScenarioLoot> loots) {
    return loots
        .where((it) => it.interactionText != null)
        .map((loot) =>
        ARSButton(
            onClick: (context) => onLootClicked(loot),
            text: Text(
              loot.interactionText,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green))
        .toList();
  }

  onLootClicked(ScenarioLoot loot) async {
    final intent = await widget._interpretLinkUseCase
        .execute(NavigationLink.fromLoot(loot));

    // Reload available loots

    navigateTo(context, intent);
  }

  refreshLoots() async {
    final newLoots =
    await widget._filterAvailableLootUseCase.execute(availableLoots);
    setState(() {
      availableLoots = newLoots;
    });
  }
}
