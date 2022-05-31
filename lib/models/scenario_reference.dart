import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'scenario_reference.freezed.dart';

part 'scenario_reference.g.dart';


@freezed
class ScenarioReference with _$ScenarioReference {

  const ScenarioReference._();

  const factory ScenarioReference({
    required String id,
    required String name,
    String? image,
    required String code,
    String? linkedFile,
    required String description,
  }) = _ScenarioReference;

  factory ScenarioReference.fromJson(Map<String, dynamic> json) =>
      _$ScenarioReferenceFromJson(json);
}