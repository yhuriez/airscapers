import 'package:airscaper/common/ars_result.dart';
import 'package:airscaper/common/colors.dart';
import 'package:airscaper/model/entities/element_description.dart';
import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/usecases/init_use_cases.dart';
import 'package:airscaper/views/common/ars_clock.dart';
import 'package:airscaper/views/common/ars_paginated_grid.dart';
import 'package:airscaper/views/home/bloc/inventory/inventory_bloc.dart';
import 'package:airscaper/views/home/bloc/timer/timer_bloc.dart';
import 'package:airscaper/views/home/game_over_screen.dart';
import 'package:airscaper/views/home/main_scan_fragment.dart';
import 'package:airscaper/views/home/scan_screen.dart';
import 'package:airscaper/views/home/success_screen.dart';
import 'package:airscaper/views/home/scenario_content_fragment.dart';
import 'package:airscaper/views/items/item_details_screen.dart';
import 'package:airscaper/views/navigation/fade_page_route.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../injection.dart';
import 'bloc/inventory/inventory_events.dart';
import 'bloc/inventory/inventory_state.dart';

final homeRouteBuilders = {
  MainScanFragment.routeName: (BuildContext context) => MainScanFragment(),
  ScanFragment.routeName: (BuildContext context) => ScanFragment(),
  ScenarioContentFragment.routeName: (BuildContext context) => ScenarioContentFragment(),
  ItemDetailsFragment.routeName: (BuildContext context) => ItemDetailsFragment()
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
  StartScenarioUseCase get _startScenarioUseCase => sl();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ARSResult<StartResult>>(
        future: _startScenarioUseCase.execute(context),
        initialData: ARSResult.loading(),
        builder: (context, snapshot) {
          if (snapshot.error != null) {
            return createErrorView(snapshot.error.toString());
          }
          final result = snapshot.data;
          if (result.errorCode != null) {
            return createErrorView(result.errorCode);
          } else if (result.loading) {
            return loadingView;
          }

          if (result.data == StartResult.ENDED) {
            _doSuccessScreen(context);
            return Container();
          }

          return Material(
            child:
                Container(color: backgroundColor, child: HomeScreenContent()),
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

  _doSuccessScreen(BuildContext context) {
    BlocProvider.of<TimerBloc>(context).add(EndTimerEvent());

    Future.delayed(
        Duration.zero,
        () =>
            Navigator.of(context).pushReplacement(SuccessScreen.createRoute()));
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

    return BlocBuilder<InventoryBloc, InventoryState>(
      builder: (context, state) {
        final List<ScenarioItem> items = state.items ?? [];
        final selectedItem = items.firstWhere(
            (it) => it.id == state.selectedItem,
            orElse: () => null);

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _createBottomBar(context, selectedItem),
              ARSPaginatedGrid(
                items: items,
                selectedItem: state.selectedItem,
                newItem: state.newItem,
                onItemClicked: (context, item, selected) {
                  _updateSelectedItem(context, item, selected);
                },
                pageNotifier: pageNotifier,
              ),
            ],
          ),
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
                  onEnd: _doGameOverScreen,
                ),
        ],
      ),
    );
  }

  _doGameOverScreen(BuildContext context) {
    Future.delayed(
        Duration.zero,
        () => Navigator.of(context)
            .pushReplacement(GameOverScreen.createRoute()));
  }

  _updateSelectedItem(
      BuildContext context, ScenarioItem selectedItem, bool isSelected) async {
    // ignore: close_sinks
    final bloc = BlocProvider.of<InventoryBloc>(context);

    var isTrackScreen = false;
    _homeNavigatorKey.currentState.popUntil((route) {
      final routeName = route.settings.name;

      if (routeName == ItemDetailsFragment.routeName) {
        if (route.settings.arguments is ScenarioElementDesc) {
          final desc = route.settings.arguments as ScenarioElementDesc;
          isTrackScreen = desc.isCurrentTrack;
        }
      }
      return true; // Will prevent pop
    });

    if (isTrackScreen) {
      bloc.add(DeselectItemInventoryEvent());
      _homeNavigatorKey.currentState.pop();
    } else {
      // Select the new item
      bloc.add(SelectItemInventoryEvent(selectedItem.id));

      if (selectedItem.isTrack) {
        await _homeNavigatorKey.currentState.pushNamed(
            ItemDetailsFragment.routeName,
            arguments: ScenarioElementDesc(selectedItem, isCurrentTrack: true));
        bloc.add(DeselectItemInventoryEvent());
      }
    }
  }
}
