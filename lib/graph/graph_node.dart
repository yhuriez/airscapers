
import 'package:airscaper/model/entities/scenario_item.dart';


class GraphModel {
  final Map<int, GraphNode> nodes;
  final List<GraphEdge> edges;

  GraphModel(this.nodes, this.edges);
}

class GraphNode {
  final ScenarioItem item;

  GraphNode(this.item);

  int get id => item.id;
}

class GraphEdge {
  final int start;
  final int end;

  GraphEdge(this.start, this.end);
}