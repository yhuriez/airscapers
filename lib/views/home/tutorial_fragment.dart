import 'package:airscaper/common/colors.dart';
import 'package:flutter/material.dart';

class TutorialFragment extends StatelessWidget {

  static const routeName = "/tutorial";

  static const tutorialElements = [
    TutorialElement("Cle", "item/11"),
    TutorialElement("Buffet", "mechanism/35"),
    TutorialElement("Panneau", "mechanism/69"),
    TutorialElement("Ecran", "mechanism/42"),
    TutorialElement("Porte", "mechanism/21")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Eléments du tutoriel"),
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
                      borderRadius: BorderRadius.circular(6.0)
                  ),
                  child: Center(
                    child: Text(element.name,
                      style: TextStyle(
                        fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                ),
              ),
            );
          }),
    );
  }

  _onElementClicked(BuildContext context, String link) async {
    Navigator.of(context).pop(link);
  }
}

class TutorialElement {
  final String name;
  final String link;

  const TutorialElement(this.name, this.link);
}
