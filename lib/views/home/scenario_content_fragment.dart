import 'package:airscaper/common/colors.dart';
import 'package:airscaper/injection.dart';
import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/model/entities/scenario_mechanism.dart';
import 'package:airscaper/model/entities/scenario_track.dart';
import 'package:airscaper/repositories/scenario_repository.dart';
import 'package:flutter/material.dart';

class ScenarioContentFragment extends StatelessWidget {
  static const routeName = "/tutorial";

  ScenarioRepository get _repository => sl();

  @override
  Widget build(BuildContext context) {
    final tutorialElements = initScenarioElements();

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Eléments du scénario"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: tutorialElements.length,
          itemBuilder: (context, index) {
            final element = tutorialElements[index];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () => _onElementClicked(context, element.link),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(element.imageLink),

                        Text(
                          element.name,
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  List<ScenarioElement> initScenarioElements() {
    List<ScenarioElement> result = [];

    final repo = _repository;
    result += repo.items
        .where((element) => element.hasQrCode)
        .map((element) =>
            ScenarioElement(element.title, "$itemKey/${element.id}", element.image))
        .toList();

    result += repo.tracks.where((element) => element.hasQrCode)
        .map((element) => ScenarioElement(element.title, "$trackKey/${element.id}", element.image))
        .toList();

    result += repo.mechanisms.map((mechanism) => ScenarioElement(
        mechanism.name, "$mechanismKey/${mechanism.id}", mechanism.states.first.image))
        .toList();

    return result;
  }

  _onElementClicked(BuildContext context, String link) async {
    Navigator.of(context).pop(link);
  }
}

class ScenarioElement {
  final String name;
  final String link;
  final String imageLink;

  const ScenarioElement(this.name, this.link, this.imageLink);
}
