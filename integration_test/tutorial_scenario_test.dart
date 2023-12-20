import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/injection.dart';
import 'package:airscaper/main.dart';
import 'package:airscaper/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:hive/hive.dart';

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

    testWidgets("Finish with success", (tester) async {

      robot = ScenarioRobot(tester);

      // Load app widget.
      await tester.pumpWidget(MainProviders(child: MainApp(child: HomeScreen())));

      await robot.checkHomeDisplayed();

      await checkDefaultDisplayForActivation(robot);

      await checkItemFound(robot);

      await checkItemUse(robot);
      await checkSearch(robot);

      await checkMultipleItemUse(robot);
      await checkCodeInput(robot);

      await checkActivation(robot);

      await checkScenarioEnd(robot);

      await Future.delayed(Duration(seconds: 10));

    });
  });
}

Future<void> checkActivation(ScenarioRobot robot) async {
  await robot.clickOn(const Key("home_debug_button"));
  await robot.clickOn(const Key("content_item_3"));
  await robot.checkScreenDisplayed("Ecran allumé");
  await robot.clickOn(const Key("details_continue_button"));
}

Future<void> checkItemFound(ScenarioRobot robot) async {
  await robot.clickOn(const Key("home_debug_button"));
  await robot.clickOn(const Key("content_item_0"));
  await robot.checkScreenDisplayed("Clé");
  await robot.clickOn(const Key("details_continue_button"));
}

Future<void> checkDefaultDisplayForActivation(ScenarioRobot robot) async {
  await robot.clickOn(const Key("home_debug_button"));
  await robot.clickOn(const Key("content_item_3"));
  await robot.checkScreenDisplayed("Ecran");
  await robot.clickOnUpButton();
}

Future<void> checkItemUse(ScenarioRobot robot) async {
  await robot.clickOn(const Key("home_debug_button"));
  await robot.clickOn(const Key("content_item_1"));
  await robot.checkScreenDisplayed("Coffre");
  await robot.dragOn(Key("inventory_item_11"), Key("details_image")); // id 11 => Clé
}

Future<void> checkSearch(ScenarioRobot robot) async {
  await robot.clickOn(const Key("details_search_button"));
  await robot.clickOn(const Key("search_item_button_0"));
  await robot.clickOn(const Key("details_continue_button"));

  await robot.clickOn(const Key("details_search_button"));
  await robot.clickOn(const Key("search_item_button_0"));
  await robot.clickOn(const Key("details_continue_button"));

  await robot.clickOn(const Key("details_search_button"));
  await robot.clickOn(const Key("search_item_button_0"));
  await robot.clickOn(const Key("details_continue_button"));
  await robot.clickOn(const Key("details_continue_button"));
}

Future<void> checkMultipleItemUse(ScenarioRobot robot) async {
  await robot.clickOn(const Key("home_debug_button"));
  await robot.clickOn(const Key("content_item_2"));
  await robot.checkScreenDisplayed("Panneau électrique");

  await robot.dragOn(Key("inventory_item_16"), Key("combination_slot_16")); // id 16 => Fil électrique
  await robot.dragOn(Key("inventory_item_39"), Key("combination_slot_39")); // id 39 => Tournevis
}

Future<void> checkCodeInput(ScenarioRobot robot) async {
  await robot.enterTextIn(const Key("mechanism_code_input"), "CD");
  await robot.clickOn(const Key("mechanism_code_confirm_button"));
  await robot.checkScreenDisplayed("Courant rétabli");
  await robot.clickOn(const Key("details_continue_button"));
}

Future<void> checkScenarioEnd(ScenarioRobot robot) async {
  await robot.clickOn(const Key("home_debug_button"));
  await robot.clickOn(const Key("content_item_4"));
  await robot.checkScreenDisplayed("Porte");
  await robot.enterTextIn(const Key("mechanism_code_input"), "9372");
  await robot.clickOn(const Key("mechanism_code_confirm_button"));

  await robot.checkExistingText("Vous avez réussi à sortir de la pièce !");
  await robot.clickOn(const Key("end_quit_button"));
  await robot.clickOn(const Key("dialog_confirm_no"));
  await robot.clickOn(const Key("end_quit_button"));
  await robot.clickOn(const Key("dialog_confirm_yes"));
}
