import 'package:airscaper/models/scenario_reference.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'scenario_index.freezed.dart';

part 'scenario_index.g.dart';

@freezed
class ScenarioIndex with _$ScenarioIndex {

  const ScenarioIndex._();

  const factory ScenarioIndex({
    required List<ScenarioReference> scenarios
  }) = _ScenarioIndex;

  factory ScenarioIndex.fromJson(Map<String, dynamic> json) =>
      _$ScenarioIndexFromJson(json);
}