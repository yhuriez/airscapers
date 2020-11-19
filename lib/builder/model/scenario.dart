import 'package:json_annotation/json_annotation.dart';

part 'scenario.g.dart';

@JsonSerializable()
class Scenario {
  final String creator;
  final String title;
  final String description;
  final int duration;
  final String image;
  final String endText;
  final String code;
  final bool endWithTimer;

  Scenario(this.creator, this.title, this.description, this.duration,
      this.image, this.endText, this.code, this.endWithTimer);

  factory Scenario.fromJson(Map<String, dynamic> json) => _$ScenarioFromJson(json);

  Map<String, dynamic> toJson() => _$ScenarioToJson(this);
}
