import 'package:airscaper/models/scenario_details.dart';
import 'package:airscaper/models/scenario_item.dart';
import 'package:airscaper/models/scenario_mechanism.dart';
import 'package:airscaper/models/scenario_track.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'scenario.freezed.dart';

part 'scenario.g.dart';


@freezed
class Scenario with _$Scenario {

  const Scenario._();

  const factory Scenario({
    required ScenarioDetails details,
    required List<ScenarioTrack> tracks,
    required List<ScenarioItem> items,
    required List<ScenarioMechanism> mechanisms,
  }) = _Scenario;

  factory Scenario.fromJson(Map<String, dynamic> json) =>
      _$ScenarioFromJson(json);
}