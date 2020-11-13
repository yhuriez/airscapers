import 'package:airscaper/graph/graph_cubit.dart';
import 'package:airscaper/graph/graph_node.dart';
import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/model/entities/scenario_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:graphview/GraphView.dart';

class GraphScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = GraphCubit();

    return CubitProvider(
      create: (_) => cubit,
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [createDropdownButton(cubit)],
                ),
              ),
              Expanded(
                child: InteractiveViewer(
                  constrained: false,
                  scaleEnabled: false,
                  boundaryMargin: EdgeInsets.all(100),
                  minScale: 0.01,
                  maxScale: 5.6,
                  child: GraphContainer(),
                ),
              ),
            ],
          )),
    );
  }

  Widget createDropdownButton(GraphCubit cubit) => DropdownButton<GraphMode>(
        value: cubit.state.graphMode,
        items: GraphMode.values
            .map((mode) => DropdownMenuItem<GraphMode>(
                value: mode,
                child: Container(
                  color: Colors.black,
                    child: Text(
                  mode.toString(),
                  style: TextStyle(color: Colors.white),
                ))))
            .toList(),
        onChanged: (newMode) => cubit.updateMode(newMode),
      );
}

class GraphContainer extends StatefulWidget {
  final BuchheimWalkerConfiguration treeBuilder = BuchheimWalkerConfiguration()
    ..siblingSeparation = (50)
    ..levelSeparation = (50)
    ..subtreeSeparation = (50)
    ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);

  final SugiyamaConfiguration layeredConfiguration = SugiyamaConfiguration()
    ..nodeSeparation = (50)
    ..levelSeparation = (50);

  @override
  _GraphContainerState createState() => _GraphContainerState();
}

class _GraphContainerState extends State<GraphContainer> {
  @override
  Widget build(BuildContext context) {
    return CubitBuilder<GraphCubit, GraphModel>(builder: (context, graphModel) {
      if (graphModel.nodes.isEmpty) {
        CubitProvider.of<GraphCubit>(context).init(context);
        return Container();
      }

      var graph = getGraph(graphModel);
      return GraphView(
        graph: graph,
        algorithm: getAlgorithm(graphModel.graphMode),
        paint: Paint()
          ..color = Colors.white30
          ..strokeWidth = 2.0,
      );
    });
  }

  Layout getAlgorithm(GraphMode graphMode) {
    if (graphMode == GraphMode.TREE) {
      return BuchheimWalkerAlgorithm(widget.treeBuilder, null);
    } else if (graphMode == GraphMode.DIRECTED) {
      return FruchtermanReingoldAlgorithm();
    } else if (graphMode == GraphMode.LAYERED) {
      return SugiyamaAlgorithm(widget.layeredConfiguration);
    } else {
      throw Exception("Algorithm not managed: $graphMode");
    }
  }

  Graph getGraph(GraphModel model) {
    final graph = Graph();

    final nodeMap = model.nodes.map((key, value) =>
        MapEntry(key, Node(createNodeContent(value, model.nodes))));
    graph.addNodes(nodeMap.values.toList());

    model.edges.forEach(
        (edge) => graph.addEdge(nodeMap[edge.start], nodeMap[edge.end]));
    return graph;
  }

  Widget createNodeContent(GraphNode node, Map<int, GraphNode> nodes) {
    if (node is GraphItemNode) {
      return createItemNodeContent(node.item);
    } else if (node is GraphTransitionNode) {
      return createTransitionNodeContent(node.transition, nodes);
    } else if (node is GraphBoundaryNode) {
      return createBoundaryNodeContent(node.title);
    } else {
      throw Exception("Graph node of type ${node.runtimeType} not managed");
    }
  }

  Widget createItemNodeContent(ScenarioItem item) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image
            (item.image == null)
                ? Container()
                : SizedBox(
                    height: 100, width: 100, child: Image.asset(item.image)),
            // Title
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: 100,
                child: Text(
                  item.title == null ? "" : item.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget createTransitionNodeContent(
      ScenarioTransition transition, Map<int, GraphNode> nodes) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(8.0)),
      child: SizedBox(
        width: 100,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                _getTransitionText(transition, nodes),
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            )),
      ),
    );
  }

  Widget createBoundaryNodeContent(String title) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.deepPurple, borderRadius: BorderRadius.circular(8.0)),
      child: SizedBox(
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }

  String _getTransitionText(
      ScenarioTransition transition, Map<int, GraphNode> nodes) {
    if (transition.expectedCodes != null &&
        transition.expectedCodes.isNotEmpty) {
      return "Codes attendus : ${transition.expectedCodes.join(", ")}";
    } else if (transition.expectedTracks != null &&
        transition.expectedTracks.isNotEmpty) {
      final trackItems = transition.expectedTracks.map((item) {
        return (nodes[item] as GraphItemNode).item.title;
      }).toList();
      return "Transition si indice trouvé : ${trackItems.join(", ")}";
    } else if (transition.expectedItemList != null &&
        transition.expectedItemList.isNotEmpty) {
      final items = transition.expectedItemList.map((item) {
        return (nodes[item] as GraphItemNode).item.title;
      }).toList();
      return "Objets pour débloquer : ${items.join(", ")}";
    } else if (transition.expectedItem != null) {
      final itemTitle =
          (nodes[transition.expectedItem] as GraphItemNode).item.title;
      return "Objets pour débloquer : $itemTitle";
    } else {
      return "Transition inconnue";
    }
  }
}
