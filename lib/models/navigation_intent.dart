import 'package:airscaper/models/scenario_item.dart';
import 'package:airscaper/models/scenario_mechanism.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_intent.freezed.dart';


@freezed
class NavigationIntent with _$NavigationIntent {

  const NavigationIntent._();

  const factory NavigationIntent.success() = _NavigationIntentSuccess;

  const factory NavigationIntent.mechanism({
    required ScenarioMechanism mechanism
  }) = _NavigationIntentMechanism;

  const factory NavigationIntent.itemDetails({
    required ScenarioItem item,
    @Default(false) bool found
  }) = _NavigationIntentItemDetails;

  const factory NavigationIntent.dialog({
    required DialogArguments arguments
  }) = _NavigationIntentDialog;
}

class DialogArguments {
  final String title;
  final String message;

  DialogArguments(this.title, this.message);
}
