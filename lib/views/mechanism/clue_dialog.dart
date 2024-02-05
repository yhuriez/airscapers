import 'dart:math';

import 'package:airscaper/models/scenario_mechanism.dart';
import 'package:airscaper/domain/usecases/mechanism_use_cases.dart';
import 'package:airscaper/views/common/ars_confirm_dialog.dart';
import 'package:airscaper/views/common/ars_dialog_base.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';

class ClueDialog extends StatefulWidget {
  final int mechanismId;
  final MechanismState state;

  LoadAvailableCluesUseCase get _loadClueUseCase => sl();

  UseClueUseCase get _useClueUseCase => sl();

  ClueDialog({Key? key, required this.state, required this.mechanismId}) : super(key: key);

  @override
  _ClueDialogState createState() => _ClueDialogState();
}

class _ClueDialogState extends State<ClueDialog> {
  late int nbExistingClues;
  late List<MechanismClue> availableClues;
  late int currentClueIndex;
  late bool showConfirm;

  MechanismClue get currentClue => availableClues[currentClueIndex];

  @override
  void initState() {
    super.initState();
    nbExistingClues = widget.state.clues.length;
    availableClues = widget._loadClueUseCase.execute(widget.mechanismId, widget.state);
    showConfirm = availableClues.isEmpty;
    currentClueIndex = max(0, availableClues.length - 1);
  }

  @override
  Widget build(BuildContext context) {
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
    final title = (nbExistingClues > 1) ? "Indice ${currentClueIndex + 1}" : "Indice";

    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(title, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)));
  }

  Widget _createClueText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(currentClue.description, style: TextStyle(fontSize: 16.0)),
    );
  }

  Widget _createButtonBar(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (currentClueIndex == 0)
              ? Container()
              : _ClueConfirmButton(
                  key: const Key("clue_confirm_button_previous"),
                  text: "Précédent",
                  action: (context) {
                      setState(() {
                        currentClueIndex--;
                      });
                    }),
          (currentClueIndex >= nbExistingClues - 1)
              ? Container()
              : _ClueConfirmButton(
                  key: const Key("clue_confirm_button_next"),
                  text: "Suivant",
                  action: (context) {
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

  _showConfirmDialog(BuildContext context) {
    String message = "Souhaitez-vous un autre indice ?";
    if (availableClues.length == 0) {
      message = "Souhaitez-vous obtenir un indice ?";
    } else if (availableClues.length == nbExistingClues - 1) {
      message = "Souhaitez-vous révéler la solution ?";
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

  useClue() {
    final newClues = widget._useClueUseCase.execute(widget.mechanismId, widget.state);
    setState(() {
      availableClues = newClues;
      currentClueIndex = availableClues.length - 1;
      showConfirm = false;
    });
  }

  _dismissDialog() {
    if (availableClues.isEmpty) {
      Navigator.of(context, rootNavigator: true).pop();
    } else {
      setState(() {
        showConfirm = false;
      });
    }
  }
}

class _ClueConfirmButton extends StatelessWidget {
  final String text;
  final Function(BuildContext) action;

  const _ClueConfirmButton({Key? key, required this.text, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text(text, style: const TextStyle(fontSize: 20, color: Colors.black),),
        onPressed: () => action(context));

  }
}
