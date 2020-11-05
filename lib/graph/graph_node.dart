
import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/model/entities/scenario_transition.dart';


class GraphModel {
  final Map<int, GraphNode> nodes;
  final List<GraphEdge> edges;

  GraphModel(this.nodes, this.edges);
}

abstract class GraphNode {
  int get id;
}

class GraphItemNode extends GraphNode {
  final ScenarioItem item;

  GraphItemNode(this.item);
  
  @override
  int get id => item.id;
}

class GraphTransitionNode extends GraphNode {
  final int transitionId;
  final ScenarioTransition transition;

  GraphTransitionNode(this.transitionId, this.transition);

  @override
  int get id => throw UnimplementedError();
}

class GraphEdge {
  final int start;
  final int end;

  GraphEdge(this.start, this.end);
}
