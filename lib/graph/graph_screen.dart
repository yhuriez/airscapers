import 'package:airscaper/graph/graph_cubit.dart';
import 'package:airscaper/graph/graph_node.dart';
import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:graphview/GraphView.dart';

class GraphScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CubitProvider(
      create: (_) => GraphCubit(),
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
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
}

class GraphContainer extends StatelessWidget {
  final BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration()
    ..siblingSeparation = (100)
    ..levelSeparation = (150)
    ..subtreeSeparation = (150)
    ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);

  final SugiyamaConfiguration sugiyamaConfiguration = SugiyamaConfiguration()
    ..nodeSeparation = (100)
    ..levelSeparation = (150);

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
        algorithm: SugiyamaAlgorithm(sugiyamaConfiguration), paint: Paint()
        ..color = Colors.white
        ..strokeWidth = 2.0,
      );
    });
  }

  Graph getGraph(GraphModel model) {
    final graph = Graph();

    final nodeMap = model.nodes.map(
        (key, value) => MapEntry(key, Node(createNodeContent(value.item))));
    graph.addNodes(nodeMap.values.toList());

    model.edges.forEach(
        (edge) => graph.addEdge(nodeMap[edge.start], nodeMap[edge.end]));
    return graph;
  }

  Widget createNodeContent(ScenarioItem item) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Image
            SizedBox(
                height: 100,
                width: 100,
                child: (item.image == null)
                    ? Container()
                    : Image.asset(item.image)),
            // Title
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                item.title == null ? "No title" : item.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
