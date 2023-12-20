import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class ScenarioRobot {

  final WidgetTester tester;

  ScenarioRobot(this.tester);

  Future<void> checkHomeDisplayed() async {
    expect(find.byKey(const Key("home_inventory_grid")), findsOneWidget,
        reason: "No inventory grid visible");
    expect(find.byKey(const Key("home_clock")), findsOneWidget, reason: "No clock visible");
    expect(find.byKey(const Key("home_notes_button")), findsOneWidget,
        reason: "No notes button visible");
    expect(find.byKey(const Key("home_quit_button")), findsOneWidget,
        reason: "No quit button visible");
  }

  Future<void> checkScreenDisplayed(String title) async {
    expect(find.text(title), findsOneWidget, reason: "No widget with '$title' found");
    expect(find.byKey(const Key("details_image")), findsOneWidget, reason: "No image found");
  }

  Future<void> checkExistingText(String text) async {
    expect(find.text(text), findsOneWidget, reason: "No widget with '$text' found");
  }

  Future<void> clickOn(Key viewKey) async {
    var viewClicked = find.byKey(viewKey);
    expect(viewClicked, findsOneWidget, reason: "No view with key '$viewKey' visible");

    await tester.tap(viewClicked);
    await tester.pumpAndSettle();
  }

  Future<void> clickOnUpButton() async {
    var viewClicked = find.byTooltip("Back");
    expect(viewClicked, findsOneWidget, reason: "No view with tooltip 'Back' visible");

    await tester.tap(viewClicked);
    await tester.pumpAndSettle();
  }

  Future<void> dragOn(Key viewToDrag, Key viewToDrop) async {
    final Finder targetFinder = find.byKey(viewToDrag);
    expect(targetFinder, findsOneWidget, reason: "No view with key '$viewToDrag' visible");

    final Offset firstLocation = tester.getCenter(targetFinder);
    await tester.press(targetFinder);

    final TestGesture gesture = await tester.startGesture(firstLocation);
    await tester.pumpAndSettle(Duration(milliseconds: 300));

    final Finder dropFinder = find.byKey(viewToDrop);
    expect(dropFinder, findsOneWidget, reason: "No view with key '$viewToDrop' visible");

    final Offset secondLocation = tester.getCenter(dropFinder);

    await gesture.moveTo(secondLocation);
    await tester.pumpAndSettle(Duration(milliseconds: 300));

    await gesture.up();

    await tester.pumpAndSettle();
  }

  Future<void> enterTextIn(Key key, String value) async {
    final inputTextView = find.byKey(key);
    expect(inputTextView, findsOneWidget, reason: "No view with key '$key' visible");

    await tester.enterText(inputTextView, value);
    await tester.pumpAndSettle();
    expect(find.text(value), findsOneWidget);
  }
}
