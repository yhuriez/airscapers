


import 'package:airscaper/model/entities/scenario_loot.dart';

class NavigationLink {
  final String route;
  final int id;

  NavigationLink(this.route, this.id);

  NavigationLink.fromLoot(ScenarioLoot loot) : this(loot.type, loot.id);
}