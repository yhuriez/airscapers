import 'package:airscaper/common/colors.dart';
import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/injection.dart';
import 'package:airscaper/models/scenario_loot.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';

class ScenarioContentFragment extends StatelessWidget {
  static const routeName = "/tutorial";

  ScenarioRepository get _repository => sl();

  static Route<String> createRoute() {
    return createFadeRoute<String>(ScenarioContentFragment(), ScenarioContentFragment.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final tutorialElements = initScenarioElements();

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Eléments du scénario"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: tutorialElements.length,
          itemBuilder: (context, index) {
            final element = tutorialElements[index];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ScenarioContentItem(
                element,
                key: ValueKey("content_item_$index"),
              ),
            );
          }),
    );
  }

  List<ScenarioElement> initScenarioElements() {
    List<ScenarioElement> result = [];

    final repo = _repository;
    result += repo.items
        .where((element) => element.hasQrCode && !element.endTrack)
        .map((element) =>
            ScenarioElement(element.title, "${LootType.item.name}/${element.id}", element.image))
        .toList();

    result += repo.mechanisms
        .map((mechanism) => ScenarioElement(mechanism.name,
            "${LootType.mechanism.name}/${mechanism.id}", mechanism.states.first.image))
        .toList();

    return result;
  }
}

class ScenarioContentItem extends StatelessWidget {
  final ScenarioElement element;

  const ScenarioContentItem(this.element, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onElementClicked(context, element.link),
      child: Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (element.imageLink != null) Image.asset(element.imageLink!),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  element.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onElementClicked(BuildContext context, String link) async {
    Navigator.of(context).pop(link);
  }
}

class ScenarioElement {
  final String name;
  final String link;
  final String? imageLink;

  const ScenarioElement(this.name, this.link, this.imageLink);
}
