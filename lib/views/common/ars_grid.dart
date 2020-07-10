import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/views/home/bloc/inventory_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiver/iterables.dart';

const GRID_ITEM_PER_PAGE = 5;
const double GRID_HEIGHT = 60;

class ARSGrid extends StatelessWidget {
  final List<ScenarioItem> items;
  final int selectedItem;
  final Function(BuildContext, ScenarioItem) onItemClicked;

  final _controller = PageController();

  ARSGrid({Key key, this.items, this.selectedItem, this.onItemClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = computePages();

    return SizedBox(
      height: GRID_HEIGHT,
      child: PageView.builder(
          controller: _controller,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return ARSGridPage(children: pages[index]);
          }),
    );
  }

  List<List<Widget>> computePages() {
    var missingItems = (items.length == 0)
        ? GRID_ITEM_PER_PAGE
        : GRID_ITEM_PER_PAGE - (items.length % GRID_ITEM_PER_PAGE);

    final imageItems = items
        .map((item) => ARSGridImageItem(
            item: item,
            selected: item.id == selectedItem,
            onItemClicked: onItemClicked))
        .toList();
    final emptyItems =
        List.generate(missingItems, (index) => ARSGridEmptyItem());

    final List<Widget> allItems = ([...imageItems, ...emptyItems]).toList();

    return partition<Widget>(allItems, GRID_ITEM_PER_PAGE).toList();
  }
}

class ARSGridPage extends StatelessWidget {
  final List<Widget> children;

  const ARSGridPage({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Row(
          children: children,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ));
  }
}

class ARSGridEmptyItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(6)),
          ),
        ),
      ),
    );
  }
}

class ARSGridImageItem extends StatelessWidget {
  final ScenarioItem item;
  final bool selected;
  final Function(BuildContext, ScenarioItem) onItemClicked;

  const ARSGridImageItem(
      {Key key, @required this.item, this.selected = false, this.onItemClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final bloc = BlocProvider.of<InventoryBloc>(context);

    var content = createContent(context, bloc);

    // If not selected, we add padding, so selected item will appear bigger than non-selected
    final hPadding = (this.selected) ? 8.0 : 12.0;
    final vPadding = (this.selected) ? 0.0 : 4.0;

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
        child: content,
      ),
    );
  }

  Widget createContent(BuildContext context, InventoryBloc bloc) => AspectRatio(
        aspectRatio: 1,
        child: InkWell(
          onTap: () {
            bloc.add(SelectItemInventoryEvent(item.id));
            onItemClicked(context, item);
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage(item.image), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      );
}
