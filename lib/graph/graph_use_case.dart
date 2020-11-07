import 'package:airscaper/graph/graph_node.dart';
import 'package:airscaper/injection.dart';
import 'package:airscaper/model/entities/scenario_transition.dart';
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

    nodes[FIRST_NODE] = GraphBoundaryNode(FIRST_NODE, "Début");

    items.forEach((item) {
      if(item.endTrack) {
        nodes[item.id] = GraphBoundaryNode(item.id, "Fin");
      } else {
        nodes[item.id] = GraphItemNode(item);
      }

      if(item.transition != null) {
        final transitionId = item.id + 1024;
        nodes[transitionId] = GraphTransitionNode(transitionId, item.transition);
        edges.add(GraphEdge(item.id, transitionId));

        item.transition.removedItems?.forEach((removedItem) {
          edges.add(GraphEdge(removedItem, transitionId));
        });

        edges.add(GraphEdge(transitionId, item.transition.transitionTo));
      }

      item.loots?.forEach((loot) {
        edges.add(GraphEdge(item.id, loot.id));
      });
      
      if(item.isFirstItem) {
        edges.add(GraphEdge(FIRST_NODE, item.id));
      }
    });

    return GraphModel(nodes, edges);
  }
}
