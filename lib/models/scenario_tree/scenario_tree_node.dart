import 'package:collection/collection.dart';


class ScenarioTreeNode {

  final String mechanismId;
  Set<ScenarioTreeNode> children = {};
  late TransitionType transitionType;

  ScenarioTreeNode(this.mechanismId);

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is ScenarioTreeNode &&
              runtimeType == other.runtimeType &&
              mechanismId == other.mechanismId;

  @override
  int get hashCode => mechanismId.hashCode;


  Set<ScenarioTreeNode> get allChildren {
    Set<ScenarioTreeNode> builder = {};
    _buildChildren(builder);
    builder.add(this);
    return builder;
  }

  void _buildChildren(Set<ScenarioTreeNode> builder) {
    if (children.isEmpty) {
      builder.add(this);
      return;
    }

    children.forEach((subNode) {
      builder.addAll(subNode.allChildren);
    });
  }

  @override
  String toString() {
    print(mechanismId);
    List<String> result = [];
    dumpRecursive(this, "", result);

    return result.join("\n");
  }

  final List<List<String>> PREFIXES = [[ " ├─ ", " │  "], [ " └─ ", "    "]];

  void dumpRecursive(
      ScenarioTreeNode node,
      String parentPrefix,
      List<String> result) {
    node.children.forEachIndexed((index, childNode) {
      List<String> prefixes = PREFIXES[(index + 1 != node.children.length) ? 0 : 1];
      result.add(parentPrefix + prefixes[0] + childNode.mechanismId);
      dumpRecursive(childNode, parentPrefix + prefixes[1], result);
    });
  }
}

enum TransitionType {
  SEARCH,
  RESOLVED,
  ITEM,
  ACTIVATION,
  NEEDFUL_HINT
}