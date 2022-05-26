import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/model/entities/scenario_loot.dart';
import 'package:airscaper/model/entities/scenario_track.dart';

class ScenarioElementDesc {
  final String title;
  final String description;
  final String imageUrl;
  final bool found;
  final bool end;
  final bool isCurrentTrack;
  final List<ScenarioLoot> loots;

  ScenarioElementDesc.fromTrack(ScenarioTrack track, {bool found = true})
      : title = track.title,
        description = (found || track.foundDescription == null)
            ? track.description
            : track.foundDescription,
        imageUrl = track.image,
        loots = track.loots,
        found = found,
        end = track.endTrack ?? false,
        isCurrentTrack = false;

  ScenarioElementDesc.fromItem(ScenarioItem item, {bool found = true, bool isCurrentTrack = false})
      : title = item.title,
        description = (found || item.foundDescription == null)
            ? item.description
            : item.foundDescription,
        imageUrl = item.image,
        loots = null,
        found = found,
        end = false,
        isCurrentTrack = isCurrentTrack;
}
