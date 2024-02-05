import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/injection.dart';
import 'package:airscaper/main.dart';
import 'package:airscaper/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:integration_test/integration_test.dart';

import 'robot/scenario_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late ScenarioRobot robot;

  group("Tutorial scenario", ()  {
    setUp(() async {
      // Clear database
      await Hive.deleteFromDisk();

      // Init dependencies
      await init(forTesting: true);

      final ScenarioRepository repository = sl();
      await repository.initIndex();

      final scenario = repository.scenarios.where((element) => element.code == "tuto").first;
      await repository.initScenario(scenario);
    });

    tearDown(() async {
      // Clear database
      await Hive.deleteFromDisk();
      await Hive.close();

      sl.reset();
    });

    testWidgets("Should finish scenario with success", (tester) async {

      robot = ScenarioRobot(tester);

      // Load app widget.
      await tester.pumpWidget(MainProviders(child: MainApp(child: HomeScreen())));

      await robot.checkHomeDisplayed();
      final startTimer = await robot.getWidgetText(const Key("clock_text"));

      await goToEcranScreen(robot);
      await robot.clickOnUpButton();

      await goToCleScreen(robot);
      await clickOnTake(robot);

      await goToCoffreScreen(robot);
      await useItem(robot, "11"); // id 11 => Clé

      await checkSearch(robot);

      await goToPanneauScreen(robot);
      await useMultipleItems(robot, ["16", "39"]); // id 16 => Fil électrique, id 39 => Tournevis

      await enterCode(robot, "CD");
      await checkIsCourantRetabliScreen(robot);
      await clickOnContinue(robot);

      await goToEcranAllumeScreen(robot);
      await clickOnContinue(robot);

      final endTimer = await robot.getWidgetText(const Key("clock_text"));
      expect(startTimer, isNot(equals(endTimer)));

      await goToPorteScreen(robot);
      await enterCode(robot, "9372");
      await checkIsEndScreen(robot);
      await confirmExit(robot);
    });

    testWidgets("Should display all clues of scenario when user ask it", (tester) async {
      robot = ScenarioRobot(tester);

      // Load app widget.
      await tester.pumpWidget(MainProviders(child: MainApp(child: HomeScreen())));

      await robot.checkHomeDisplayed();

      await goToEcranScreen(robot);
      await checkAllClues(robot, 2);
      await robot.clickOnUpButton();

      await goToCleScreen(robot);
      await clickOnContinue(robot);

      await goToCoffreScreen(robot);
      await checkAllClues(robot, 1);
      await useItem(robot, "11"); // id 11 => Clé

      await checkSearch(robot);

      await goToPanneauScreen(robot);
      await checkAllClues(robot, 2);
      await useMultipleItems(robot, ["16", "39"]); // id 16 => Fil électrique, id 39 => Tournevis

      await checkAllClues(robot, 3);
      await enterCode(robot, "CD");
      await checkIsCourantRetabliScreen(robot);
      await clickOnContinue(robot);

      await goToEcranAllumeScreen(robot);
      await clickOnContinue(robot);

      await goToPorteScreen(robot);
      await checkAllClues(robot, 3);
      await enterCode(robot, "9372");
      await checkIsEndScreen(robot);

      await checkClueUsedCountDisplayed(robot, 11);
      await confirmExit(robot);
    });
  });

  testWidgets("Should finish with game over when timer is finished", (tester) async {
    // Modify start date to reduce timer
  });

  testWidgets("Should add notes and keep it", (tester) async {
    // TODO
  });
}

Future<void> goToEcranAllumeScreen(ScenarioRobot robot) async {
  await robot.clickOn(const Key("home_debug_button"));
  await robot.clickOn(const Key("content_item_3"));
  await robot.checkScreenDisplayed("Ecran allumé");
}

Future<void> goToCleScreen(ScenarioRobot robot) async {
  await robot.clickOn(const Key("home_debug_button"));
  await robot.clickOn(const Key("content_item_0"));
  await robot.checkScreenDisplayed("Clé");
}

Future<void> goToEcranScreen(ScenarioRobot robot) async {
  await robot.clickOn(const Key("home_debug_button"));
  await robot.clickOn(const Key("content_item_3"));
  await robot.checkScreenDisplayed("Ecran");
}

Future<void> goToCoffreScreen(ScenarioRobot robot) async {
  await robot.clickOn(const Key("home_debug_button"));
  await robot.clickOn(const Key("content_item_1"));
  await robot.checkScreenDisplayed("Coffre");
}

Future<void> goToPanneauScreen(ScenarioRobot robot) async {
  await robot.clickOn(const Key("home_debug_button"));
  await robot.clickOn(const Key("content_item_2"));
  await robot.checkScreenDisplayed("Panneau électrique");
}

Future<void> goToPorteScreen(ScenarioRobot robot) async {
  await robot.clickOn(const Key("home_debug_button"));
  await robot.clickOn(const Key("content_item_4"));
  await robot.checkScreenDisplayed("Porte");
}

Future<void> checkIsCourantRetabliScreen(ScenarioRobot robot) async {
  await robot.checkScreenDisplayed("Courant rétabli");
}

Future<void> checkIsEndScreen(ScenarioRobot robot) async {
  await robot.checkExistingText("Vous avez réussi à sortir de la pièce !");
}

Future<void> clickOnContinue(ScenarioRobot robot) async {
  await robot.clickOn(const Key("details_continue_button"));
}

Future<void> clickOnTake(ScenarioRobot robot) async {
  await robot.clickOn(const Key("details_pick_button"));
}

Future<void> useItem(ScenarioRobot robot, String itemId) async {
  await robot.dragOn(Key("inventory_item_$itemId"), Key("details_image"));
}

Future<void> checkSearch(ScenarioRobot robot) async {
  await robot.clickOn(const Key("details_search_button"));
  await robot.clickOn(const Key("search_item_button_0"));
  await clickOnTake(robot);

  await robot.clickOn(const Key("details_search_button"));
  await robot.clickOn(const Key("search_item_button_0"));
  await clickOnTake(robot);

  await robot.clickOn(const Key("details_search_button"));
  await robot.clickOn(const Key("search_item_button_0"));
  await clickOnTake(robot);
  await clickOnContinue(robot);
}

Future<void> useMultipleItems(ScenarioRobot robot, List<String> ids) async {
  await Future.forEach(ids, (id) async {
    return await robot.dragOn(Key("inventory_item_$id"), Key("combination_slot_$id"));
  });
}

Future<void> enterCode(ScenarioRobot robot, String value) async {
  await robot.enterTextIn(const Key("mechanism_code_input"), value);
  await robot.clickOn(const Key("mechanism_code_confirm_button"));
}

Future<void> confirmExit(ScenarioRobot robot) async {
  await robot.clickOn(const Key("end_quit_button"));
  await robot.clickOn(const Key("dialog_confirm_no"));
  await robot.clickOn(const Key("end_quit_button"));
  await robot.clickOn(const Key("dialog_confirm_yes"));
}

Future<void> checkAllClues(ScenarioRobot robot, int clueCount) async {
  await robot.clickOn(const Key("clue_action_button"));
  await robot.clickOn(const Key("dialog_confirm_yes"));
  await robot.checkNotVisible(const Key("clue_confirm_button_previous"));
  for (int index = 0; index < clueCount - 1; index++) {
    await robot.clickOn(const Key("clue_confirm_button_next"));
    await robot.clickOn(const Key("dialog_confirm_yes"));
  }
  await robot.checkNotVisible(const Key("clue_confirm_button_next"));
  await robot.tapTopLeftScreen();
}

Future<void> checkClueUsedCountDisplayed(ScenarioRobot robot, int clueCount) async {
  await robot.checkExistingText(clueCount.toString());
}