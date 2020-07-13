import 'dart:math';

import 'package:airscaper/model/entities/scenario_mechanism.dart';
import 'package:airscaper/usecases/mechanism_use_cases.dart';
import 'package:airscaper/views/common/ars_confirm_dialog.dart';
import 'package:airscaper/views/common/ars_dialog_base.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';

class ClueDialog extends StatefulWidget {
  final MechanismState state;

  final LoadAvailableCluesUseCase _loadClueUseCase = sl();
  final UseClueUseCase _useClueUseCase = sl();

  ClueDialog({Key key, this.state}) : super(key: key);

  @override
  _ClueDialogState createState() => _ClueDialogState();
}

class _ClueDialogState extends State<ClueDialog> {

  int nbExistingClues;

  // State
  List<MechanismClue> availableClues;
  int currentClueIndex = -1;
  bool showConfirm = true;

  MechanismClue get currentClue => availableClues[currentClueIndex];

  @override
  void initState() {
    super.initState();
    nbExistingClues = widget.state.clues.length;
    _initAvailableClues();
  }

  _initAvailableClues() async {
    final clues = await widget._loadClueUseCase.execute(widget.state);
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

    return ARSDialogBase(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // Title
          _createClueTitle(context),

          // Description
          _createClueText(context),

          // Previous - Next
          _createButtonBar(context)
        ])),);
  }

  Widget _createClueTitle(BuildContext context) {
    final title = (nbExistingClues > 1)
        ? "Indice ${currentClueIndex + 1}"
        : "Indice";

    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))
    );
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

  Widget _createButton(BuildContext context,
      String text,
      Function(BuildContext) action,) =>
      FlatButton(
          child: Text(text),
          onPressed: () => action(context),
          textColor: Colors.black);

  _showConfirmDialog(BuildContext context) {
    String message = "Souhaitez-vous un autre indice ?";
    if (currentClueIndex < 0) {
      message = "Souhaitez-vous obtenir un indice ?";
    }

    return ARSConfirmDialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(message, style: TextStyle(fontSize: 16),),
        ),
        onCancelClicked: (context) => _dismissDialog(),
        onOkClicked: (context) {
          useClue();
        });
  }

  useClue() async {
    final newClues = await widget._useClueUseCase.execute(widget.state);
    setState(() {
      availableClues = newClues;
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
