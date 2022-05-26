import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'scenario_details.freezed.dart';

part 'scenario_details.g.dart';


@freezed
class ScenarioDetails with _$ScenarioDetails {

  const ScenarioDetails._();

  const factory ScenarioDetails({
    required String title,
    required int duration,
    required String endText,
  }) = _ScenarioDetails;

  factory ScenarioDetails.fromJson(Map<String, dynamic> json) =>
      _$ScenarioDetailsFromJson(json);
}