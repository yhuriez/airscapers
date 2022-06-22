
import 'package:airscaper/domain/storage/scenario_storage.dart';
import 'package:airscaper/injection.dart';
import 'package:flutter/material.dart';

class NotesState with ChangeNotifier {

  final ScenarioStateStorage _storage = sl();

  String? _notes;

  String? get notes => _notes;

  NotesState() {
    init();
  }

  init() {
    _notes = _storage.getProperty(ScenarioStateStorage.notesKey);
    notifyListeners();
  }

  void updateMessage(String value) {
    _notes = value;
    notifyListeners();
  }

  void validate() {
    _storage.saveProperty(ScenarioStateStorage.notesKey, _notes ?? "");
  }
}
