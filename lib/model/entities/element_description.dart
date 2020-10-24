import 'package:airscaper/model/entities/scenario_item.dart';

class ScenarioElementDesc {
  final ScenarioItem item;
  final bool found;
  final bool isCurrentTrack;

  ScenarioElementDesc(this.item,
      {this.found = true, this.isCurrentTrack = false});
}
