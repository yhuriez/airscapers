import 'package:airscaper/models/scenario_tree/scenario_tree_node.dart';

class ScenarioTreeResult {
  final ScenarioTreeNode rootNode;
  final ScenarioTreeErrors errors;

  ScenarioTreeResult(
    this.rootNode,
    this.errors,
  );
}

class ScenarioTreeErrors {
  List<String> unusedItems = [];
  List<String> notCollectableItems = [];
  List<String> unresolvableMechanisms = [];
  List<String> circularDependency = [];
  bool missingEnd = false;
}
