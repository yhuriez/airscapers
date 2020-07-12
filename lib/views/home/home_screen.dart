import 'package:airscaper/common/ars_result.dart';
import 'package:airscaper/common/colors.dart';
import 'package:airscaper/model/entities/element_description.dart';
import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/usecases/init_use_cases.dart';
import 'package:airscaper/views/common/ars_clock.dart';
import 'package:airscaper/views/common/ars_grid.dart';
import 'package:airscaper/views/home/bloc/inventory_bloc.dart';
import 'package:airscaper/views/home/bloc/timer_bloc.dart';
import 'package:airscaper/views/home/end_screen.dart';
import 'package:airscaper/views/home/main_scan_fragment.dart';
import 'package:airscaper/views/home/scan_screen.dart';
import 'package:airscaper/views/inventory/inventory_details_screen.dart';
import 'package:airscaper/views/mechanism/mechanism_screen.dart';
import 'package:airscaper/views/navigation/fade_page_route.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../injection.dart';

final homeRouteBuilders = {
  MainScanFragment.routeName: (BuildContext context) => MainScanFragment(),
  ScanFragment.routeName: (BuildContext context) => ScanFragment(),
  InventoryDetailsFragment.routeName: (BuildContext context) =>
      InventoryDetailsFragment(),
  MechanismFragment.routeName: (BuildContext context) => MechanismFragment()
};

class HomeScreen extends StatelessWidget {

  static const routeName = "/home";

  static Route<dynamic> createRoute() {
    return createFadeRoute(HomeScreen(), HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TimerBloc()),
        BlocProvider(create: (context) => InventoryBloc()),
      ],
      child: SafeArea(
          child: KeyboardVisibilityProvider(child: HomeScreenLoader())),
    );
  }
}

class HomeScreenLoader extends StatelessWidget {
  final StartScenarioUseCase _startScenarioUseCase = sl();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ARSResult<bool>>(
        future: _startScenarioUseCase.execute(context),
        initialData: ARSResult.loading(),
        builder: (context, snapshot) {
          if (snapshot.error != null) {
            return createErrorView(snapshot.error);
          }
          final result = snapshot.data;
          if (result.errorCode != null) {
            return createErrorView(result.errorCode);
          } else if (result.loading) {
            return loadingView;
          }

          return Material(
            child: Container(
                color: backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: HomeScreenContent(),
                )),
          );
        });
  }

  Widget createErrorView(String errorCode) => Material(
    child: Container(
        color: backgroundColor,
        child: Center(
            child: Text(
          errorCode,
          style: TextStyle(fontSize: 20),
        ))),
  );

  Widget get loadingView => Material(
    child: Container(
          color: backgroundColor,
          child: Center(
            child: JumpingDotsProgressIndicator(
                color: textColor,
                numberOfDots: 4,
                fontSize: 40.0,
                dotSpacing: 2.0),
          ),
        ),
  );
}

/// Visual content of the home page
class HomeScreenContent extends StatelessWidget {

  final EndScenarioUseCase _endScenarioUseCase = sl();

  final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // Main view
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: _createHomeNavigation(context),
        )),

        // Inventory
        (KeyboardVisibilityProvider.isKeyboardVisible(context))
            ? Container()
            : createInventory(context)
      ],
    );
  }

  Widget createInventory(BuildContext context) {
    return BlocBuilder<InventoryBloc, InventoryState>(
      builder: (context, state) {
        final List<ScenarioItem> items = state.items ?? [];
        final selectedItem = items.firstWhere(
            (it) => it.id == state.selectedItem,
            orElse: () => null);

        return Column(
          children: [
            _createBottomBar(context, selectedItem),
            ARSGrid(
                items: items,
                selectedItem: state.selectedItem,
                onItemClicked: _startItemScreen),
          ],
        );
      },
    );
  }

  Widget _createHomeNavigation(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _homeNavigatorKey.currentState.maybePop();
        return false;
      },
      child: Navigator(
          key: _homeNavigatorKey,
          initialRoute: MainScanFragment.routeName,
          onGenerateRoute: (RouteSettings settings) => FadeBlackPageRoute(
              settings: settings, builder: homeRouteBuilders[settings.name])),
    );
  }

  Widget _createBottomBar(BuildContext context, ScenarioItem selectedItem) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Selected item name
          (selectedItem == null)
              ? Container()
              : Text(
                  selectedItem.title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: textColor),
                ),

          // Spacing components
          Spacer(),

          // Clock
          (KeyboardVisibilityProvider.isKeyboardVisible(context))
              ? Container()
              : ARSClock(
                  onEnd: doGameOverScreen,
                ),
        ],
      ),
    );
  }

  doGameOverScreen(BuildContext context) async {
    await _endScenarioUseCase.execute();

    Future.delayed(
        Duration.zero,
        () => Navigator.of(context)
            .pushReplacement(GameOverScreen.createRoute()));
  }

  _startItemScreen(BuildContext context, ScenarioItem selectedItem) {
    if(selectedItem.isTrack) {
      _homeNavigatorKey.currentState.pushNamed(InventoryDetailsFragment.routeName,
          arguments: ScenarioElementDesc.fromItem(selectedItem));
    }
  }
}
