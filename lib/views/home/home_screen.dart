import 'package:airscaper/common/colors.dart';
import 'package:airscaper/models/scenario_item.dart';
import 'package:airscaper/views/common/ars_clock.dart';
import 'package:airscaper/views/common/ars_paginated_grid.dart';
import 'package:airscaper/views/home/notes/notes_page.dart';
import 'package:airscaper/views/home/state/inventory_state.dart';
import 'package:airscaper/views/home/game_over_screen.dart';
import 'package:airscaper/views/home/main_scan_fragment.dart';
import 'package:airscaper/views/home/scan_screen.dart';
import 'package:airscaper/views/home/scenario_content_fragment.dart';
import 'package:airscaper/views/inventory/item_screen.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';


final homeRouteBuilders = {
  MainScanFragment.routeName: () => MainScanFragment.createRoute(),
  ScanFragment.routeName: () => ScanFragment.createRoute(),
  ScenarioContentFragment.routeName: () => ScenarioContentFragment.createRoute()
};

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";

  static Route<Object> createRoute() {
    return createFadeRoute(HomeScreen(), HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: KeyboardVisibilityProvider(
            child: Material(child: Container(color: backgroundColor, child: HomeScreenContent()))));
  }
}

/// Visual content of the home page
class HomeScreenContent extends StatelessWidget {
  final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // Main view
        Expanded(child: _createHomeNavigation(context)),

        // Inventory
        (KeyboardVisibilityProvider.isKeyboardVisible(context))
            ? Container()
            : createInventory(context)
      ],
    );
  }

  Widget createInventory(BuildContext context) {
    final pageNotifier = ValueNotifier(0);

    final state = context.watch<InventoryState>();

    final List<ScenarioItem> items = state.items;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _createBottomBar(context),
          ARSPaginatedGrid(
            items: items,
            selectedItem: state.selectedItem?.id,
            newItem: state.newItem?.id,
            onItemClicked: (context, item, selected) {
              _updateSelectedItem(context, item, selected);
            },
            pageNotifier: pageNotifier,
          ),
        ],
      ),
    );
  }

  Widget _createHomeNavigation(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _homeNavigatorKey.currentState?.maybePop();
        return false;
      },
      child: Navigator(
          key: _homeNavigatorKey,
          initialRoute: MainScanFragment.routeName,
          onGenerateRoute: (RouteSettings settings) => homeRouteBuilders[settings.name]?.call()),
    );
  }

  Widget _createBottomBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Selected item name
          InkWell(
            onTap: () => Navigator.of(context).push(NotesPage.route()),
            child: Row(
              children: [
                Icon(Icons.text_snippet_outlined, color: Colors.white),
                SizedBox(width: 8,),
                Text("Notes",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontStyle: FontStyle.italic
                  )
                )
              ],
            ),
          ),

          // Spacing components
          Spacer(),

          // Clock
          (KeyboardVisibilityProvider.isKeyboardVisible(context))
              ? Container()
              : ARSClock(
                  onEnd: _doGameOverScreen,
                ),
        ],
      ),
    );
  }

  _doGameOverScreen(BuildContext context) {
    Future.delayed(
        Duration.zero, () => Navigator.of(context).pushReplacement(GameOverScreen.createRoute()));
  }

  _updateSelectedItem(BuildContext context, ScenarioItem selectedItem, bool isSelected) async {

    final state = context.read<InventoryState>();

    // Select the new item
    state.selectItem(selectedItem.id);

    await _homeNavigatorKey.currentState?.push(InventoryDetailsFragment.route(selectedItem));
    state.unselectItem(selectedItem.id);
  }
}
