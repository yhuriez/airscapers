import 'package:airscaper/common/entities/scenario_clue.dart';
import 'package:airscaper/common/entities/scenario_item.dart';
import 'package:airscaper/app/views/home/bloc/inventory/inventory_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_i18n/flutter_i18n.dart';

extension ListMap<T> on List<T> {
  List<U> mapIndexed<U>(U Function(int, T) call) {
    return this
        .asMap()
        .map((index, value) => MapEntry(index, call(index, value)))
        .values
        .toList();
  }
}

extension ScenarioItemExtension on ScenarioItem {
  List<ScenarioClue> getScenarioClues() {
    return clues.mapIndexed(
        (index, clueText) => ScenarioClue(id * 100 + index, clueText));
  }
}

extension ContextExtension on BuildContext {
  InventoryBloc get inventoryBloc => BlocProvider.of<InventoryBloc>(this);
}


// TODO Move content to en.json when flutter_i18n is repaired
const Map<String, dynamic> strings = {
  "builder": {
    "login": {
      "email": "Email",
      "password": "Password",
      "sign_in": "Sign in",
      "create_account": "Create account",
      "email_invalid_error": "This email is invalid, please type a correct email address",
      "email_empty_error": "Please type your email address here",
      "password_empty_error": "Please type your password here"
    }
  }
};

String _getStringValueRecursive(Map<String, dynamic> values, List<String> path, int pathIndex) {
  final currentValue = values[path[pathIndex]];
  if(currentValue is Map<String, dynamic>) {
    return _getStringValueRecursive(currentValue, path, pathIndex + 1);
  } else if (currentValue is String) {
    return currentValue;
  } else {
    throw UnsupportedError("Type of ${currentValue.runtimeType} is not managed");
  }
}

extension TranslateExtension on BuildContext {
  String translate(String key) => _getStringValueRecursive(strings, key.split("."), 0);

  // String translate(String key) => FlutterI18n.translate(this, key);
  // String plurals(String key, int pluralValue) => FlutterI18n.plural(this, key, pluralValue);
}

