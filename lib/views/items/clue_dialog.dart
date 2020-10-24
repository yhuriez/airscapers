import 'dart:math';

import 'package:airscaper/model/entities/scenario_clue.dart';
import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/views/common/ars_confirm_dialog.dart';
import 'package:airscaper/views/common/ars_dialog_base.dart';
import 'package:flutter/material.dart';
import 'package:airscaper/common/extensions.dart';


class ClueDialog extends StatefulWidget {
  final ScenarioItem item;

  ClueDialog({Key key, this.item}) : super(key: key);

  @override
  _ClueDialogState createState() => _ClueDialogState();
}

class _ClueDialogState extends State<ClueDialog> {
  int nbExistingClues;

  // State
  List<ScenarioClue> availableClues;
  int currentClueIndex = -1;
  bool showConfirm = true;

  ScenarioClue get currentClue => availableClues[currentClueIndex];

  @override
  void initState() {
    super.initState();
    nbExistingClues = widget.item.clues.length;
    _initAvailableClues();
  }

  _initAvailableClues() async {
    final clues = getUsedClues();

    setState(() {
      availableClues = clues;
      showConfirm = availableClues.isEmpty;
      currentClueIndex = max(0, availableClues.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentClueIndex == -1 || availableClues == null) {
      return Container();
    }

    if (showConfirm) {
      return _showConfirmDialog(context);
    }

    if (availableClues.isEmpty) {
      return ARSDialogBase(child: Text("Aucun indice n'est disponible ici."));
    }

    return ARSDialogBase(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            // Title
            _createClueTitle(context),

            // Description
            _createClueText(context),

            // Previous - Next
            _createButtonBar(context)
          ])),
    );
  }

  Widget _createClueTitle(BuildContext context) {
    final title =
        (nbExistingClues > 1) ? "Indice ${currentClueIndex + 1}" : "Indice";

    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)));
  }

  Widget _createClueText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(currentClue.text, style: TextStyle(fontSize: 16.0)),
    );
  }

  Widget _createButtonBar(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (currentClueIndex == 0)
              ? Container()
              : _createButton(context, "Précédent", (context) {
                  setState(() {
                    currentClueIndex--;
                  });
                }),
          (currentClueIndex >= nbExistingClues - 1)
              ? Container()
              : _createButton(context, "Suivant", (context) {
                  setState(() {
                    if (currentClueIndex >= availableClues.length - 1) {
                      showConfirm = true;
                    } else {
                      currentClueIndex++;
                    }
                  });
                })
        ]);
  }

  Widget _createButton(
    BuildContext context,
    String text,
    Function(BuildContext) action,
  ) =>
      FlatButton(
          child: Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () => action(context),
          textColor: Colors.black);

  _showConfirmDialog(BuildContext context) {
    String message = "Souhaitez-vous un autre indice ?";
    if (availableClues.length == 0) {
      message = "Souhaitez-vous obtenir un indice ?";
    }

    return ARSConfirmDialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message,
            style: TextStyle(fontSize: 16),
          ),
        ),
        onCancelClicked: (context) => _dismissDialog(),
        onOkClicked: (context) {
          useClue();
        });
  }

  List<ScenarioClue> getUsedClues() {
    final inventoryState = context.inventoryBloc.state;
    return widget.item
        .getScenarioClues()
        .where((clue) => inventoryState.usedClues.contains(clue.id))
        .toList();
  }

  useClue() async {
    final allClues = widget.item.getScenarioClues();
    var usedClues = getUsedClues();

    if (usedClues.length < allClues.length) {
      usedClues.sort((a, b) => a.id - b.id);
      allClues.sort((a, b) => a.id - b.id);

      final nextClue = allClues[usedClues.length];
      usedClues += [nextClue];
    }

    setState(() {
      availableClues = usedClues;
      currentClueIndex = availableClues.length - 1;
      showConfirm = false;
    });
  }

  _dismissDialog() {
    if (availableClues == null || availableClues.isEmpty) {
      Navigator.of(context, rootNavigator: true).pop();
    } else {
      setState(() {
        showConfirm = false;
      });
    }
  }
}
