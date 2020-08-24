import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/model/entities/scenario_loot.dart';
import 'package:airscaper/model/entities/scenario_track.dart';

class ScenarioElementDesc {
  final String title;
  final String description;
  final String imageUrl;
  final bool found;
  final bool end;
  final List<ScenarioLoot> loots;

  ScenarioElementDesc._(this.title, this.description, this.imageUrl, this.found,
      {this.loots, this.end = false});

  ScenarioElementDesc.fromTrack(ScenarioTrack track, {bool found = true})
      : title = track.title,
        description = (found || track.foundDescription == null)
            ? track.description
            : track.foundDescription,
        imageUrl = track.image,
        loots = track.loots,
        found = found,
        end = track.endTrack ?? false;

  ScenarioElementDesc.fromItem(ScenarioItem item, {bool found = true})
      : title = item.title,
        description = (found || item.foundDescription == null)
            ? item.description
            : item.foundDescription,
        imageUrl = item.image,
        loots = null,
        found = found,
        end = false;
}
