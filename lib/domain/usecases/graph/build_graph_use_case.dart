import 'package:airscaper/models/scenario.dart';
import 'package:airscaper/models/scenario_mechanism.dart';
import 'package:airscaper/models/scenario_tree/scenario_tree_node.dart';
import 'package:airscaper/models/scenario_tree/scenario_tree_result.dart';
import 'package:collection/collection.dart';

class BuildGraphUseCase {
  Future<ScenarioTreeResult> execute(Scenario scenario) async {
    final Map<String, ScenarioMechanism> mechanismsMap = {};
    final Map<String, Set<String>> itemRequiredId = {};
    final Map<String, String> itemPickedIn = {};
    final Map<String, ScenarioTreeNode> nodes = {};
    final ScenarioTreeErrors errors = ScenarioTreeErrors();

    scenario.mechanisms.forEach((mechanism) {
      final currentNode = nodes.putIfAbsent(mechanism.id, () => ScenarioTreeNode(mechanism.id));

      mechanismsMap[mechanism.id] = mechanism;

      _onSolveMechanism(currentNode, scenario, mechanism, nodes, itemRequiredId, itemPickedIn);

      final transitionId = mechanism.transitionId;
      if (transitionId != null) {
        final nextNode = nodes.putIfAbsent(transitionId, () => ScenarioTreeNode(transitionId));
        nextNode.children.add(currentNode);
        nextNode.transitionType = TransitionType.RESOLVED;
        print("-- Transition link : ${nextNode.mechanismId} need ${currentNode.mechanismId}");

      } else if (mechanism.solving.isResolvable) {
        // A resolvable mechanism (with code, item required etc.) must have a transitionId or it's
        // an isolated mechanism
        errors.unresolvableMechanisms.add(mechanism.id);
      }
    });

    scenario.items.forEach((item) {
      _createMissingNodes(item.id, nodes, itemRequiredId[item.id] ?? {}, itemPickedIn[item.id], errors);
    });

    final lastMechanism = scenario.mechanisms.firstWhereOrNull((element) => element.isEnd);
    if (lastMechanism == null) {
      errors.missingEnd = true;
      return ScenarioTreeResult(nodes.values.first, errors);
    }

    final rootNode = nodes[lastMechanism.id];

    return ScenarioTreeResult(
        rootNode ?? nodes.values.first, errors
    );
  }


  void _onSolveMechanism(
      ScenarioTreeNode currentNode,
      Scenario scenario,
      ScenarioMechanism mechanism,
      Map<String, ScenarioTreeNode> nodes,
      Map<String, Set<String>> itemRequiredIn,
      Map<String, String> itemPickedIn) {

    mechanism.solving.when(
        // Add picked item to itemPickedIn map
        pick: (newItemId) {
          itemPickedIn[newItemId] = mechanism.id;
        },

        // Add this node to inputNodes of all mechanisms linked by given loots
        search: (loots) {
          loots.forEach((loot) {
            final nextNode = nodes.putIfAbsent(loot.id, () => ScenarioTreeNode(loot.id));
            nextNode.children.add(currentNode);
            nextNode.transitionType = TransitionType.SEARCH;
            print("-- Search link : ${nextNode.mechanismId} need ${currentNode.mechanismId}");
          });
        },

        // Nothing to do here
        visual: () {},

        // Add removed items to itemRequiredIn
        code: (_, __, List<String> removedItems, List<String> needfulHintIds) {
          _onRemovedItems(removedItems, mechanism.id, itemRequiredIn);
          _onNeedfulHint(needfulHintIds, currentNode, nodes);
        },

        // Add removed items to itemRequiredIn
        use: (_, List<String> removedItems, List<String> needfulHintIds) {
          _onRemovedItems(removedItems, mechanism.id, itemRequiredIn);
          _onNeedfulHint(needfulHintIds, currentNode, nodes);
        },

        // Add removed items to itemRequiredIn
        combine: (_, List<String> removedItems, List<String> needfulHintIds) {
          _onRemovedItems(removedItems, mechanism.id, itemRequiredIn);
          _onNeedfulHint(needfulHintIds, currentNode, nodes);
        },

        // Add required mechanism to this mechanism node inputs
        activation: (mechanismIds) {
          mechanismIds.forEach((id) {
            final nextNode = nodes.putIfAbsent(id, () => ScenarioTreeNode(id));
            currentNode.children.add(nextNode);
            currentNode.transitionType = TransitionType.ACTIVATION;
            print("-- Activation link : ${currentNode.mechanismId} need ${nextNode.mechanismId}");
          });
        });
  }

  void _onRemovedItems(
      List<String> removedItems,
      String mechanismId,
      Map<String, Set<String>> itemRequiredIn) {
    removedItems.forEach((itemId) {
      final set = itemRequiredIn.putIfAbsent(itemId, () => {});
      set.add(mechanismId);
    });
  }

  void _onNeedfulHint(
      List<String> needfulHintIds,
      ScenarioTreeNode currentNode,
      Map<String, ScenarioTreeNode> nodes) {
    needfulHintIds.forEach((itemId) {
      final nextNode = nodes.putIfAbsent(itemId, () => ScenarioTreeNode(itemId));
      currentNode.children.add(nextNode);
      nextNode.transitionType = TransitionType.NEEDFUL_HINT;
      print("-- Needful hint : ${currentNode.mechanismId} need ${nextNode.mechanismId}");
    });
  }

  void _createMissingNodes(
      String itemId,
      Map<String, ScenarioTreeNode> nodes,
      Set<String> requiredIn,
      String? pickedIn,
      ScenarioTreeErrors errors) {
    if (pickedIn == null) {
      // Error case
      print("No trace of mechanism where to pick the item");
      errors.notCollectableItems.add(itemId);
      return;
    }

    if (requiredIn.isEmpty) {
      // Error case
      print("No required mechanism for item");
      errors.unusedItems.add(itemId);
      return;
    }

    requiredIn.forEach((outputMechanismId) {
      final usedInNode = nodes.putIfAbsent(outputMechanismId, () => ScenarioTreeNode(outputMechanismId));
      final pickedInNode = nodes.putIfAbsent(pickedIn, () => ScenarioTreeNode(pickedIn));
      usedInNode.children.add(pickedInNode);
      usedInNode.transitionType = TransitionType.ITEM;
      print("-- Item link : ${usedInNode.mechanismId} need ${pickedInNode.mechanismId}");
    });
  }
}
