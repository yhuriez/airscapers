import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'scenario_track.freezed.dart';

part 'scenario_track.g.dart';


@freezed
class ScenarioTrack with _$ScenarioTrack {

  const ScenarioTrack._();

  const factory ScenarioTrack({
    required int id,
    required String description,
    String? foundDescription,
    String? image,
    required String title,
    @Default(false) bool endTrack,
    List<ScenarioLoot> loots,
    @Default(false) bool hasQrCode,
  }) = _ScenarioTrack;

  factory ScenarioTrack.fromJson(Map<String, dynamic> json) =>
      _$ScenarioTrackFromJson(json);
}