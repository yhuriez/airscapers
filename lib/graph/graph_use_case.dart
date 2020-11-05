import 'package:airscaper/graph/graph_node.dart';
import 'package:airscaper/injection.dart';
import 'package:airscaper/repositories/scenario_repository.dart';
import 'package:flutter/material.dart';

class CreateItemTreeUseCase {
  ScenarioRepository get repository => sl();

  Future<GraphModel> execute(BuildContext context) async {
    await repository.initIndex(context);
    await repository.initScenario(context, repository.scenarios.first);

    final items = repository.items;

    final Map<int, GraphNode> nodes = {};
    final edges = <GraphEdge>[];

    items.forEach((item) {
      nodes.putIfAbsent(item.id, () => GraphNode(item));

      item.transition?.removedItems?.forEach((removedItem) {
        edges.add(GraphEdge(removedItem, item.id));
      });

      final transitionTo = item.transition?.transitionTo;
      if (transitionTo != null) {
        edges.add(GraphEdge(item.id, transitionTo));
      }

      item.loots?.forEach((loot) {
        edges.add(GraphEdge(item.id, loot.id));
      });
    });

    return GraphModel(nodes, edges);
  }
}
