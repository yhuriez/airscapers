import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/views/common/ars_drag_target.dart';
import 'package:airscaper/views/home/bloc/inventory_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiver/iterables.dart';

const GRID_ITEM_PER_PAGE = 5;
const double GRID_HEIGHT = 60;
const double ITEM_SIZE = 50;

class ARSPaginatedGrid extends StatelessWidget {
  final List<ScenarioItem> items;
  final int selectedItem;
  final Function(BuildContext, ScenarioItem) onItemClicked;

  final _controller = PageController();

  ARSPaginatedGrid(
      {Key key,
      this.items,
      this.selectedItem,
      this.onItemClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = computePages(context);

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

  List<List<Widget>> computePages(BuildContext context) {
    var missingItems = (items.length == 0)
        ? GRID_ITEM_PER_PAGE
        : GRID_ITEM_PER_PAGE - (items.length % GRID_ITEM_PER_PAGE);

    // ignore: close_sinks
    final bloc = BlocProvider.of<InventoryBloc>(context);

    final imageItems = items
        .map((item) => ARSGridImageItem(
            item: item,
            selected: item.id == selectedItem,
            onItemClicked: (context, item) {
              bloc.add(SelectItemInventoryEvent(item.id));
              onItemClicked(context, item);
            }))
        .toList();

    final emptyItems = List.generate(
        missingItems,
        (index) => ARSGridEmptyItem());

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
          children: children.map((item) => Expanded(child: item)).toList(),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ));
  }
}

class ARSGridEmptyItem extends StatelessWidget {

  final OnAcceptedData<ScenarioItem> onAcceptedData;

  const ARSGridEmptyItem({Key key, this.onAcceptedData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
      child: AspectRatio(
        aspectRatio: 1,
        child: createContent(),
      ),
    );
  }

  Widget createContent() {
    if (onAcceptedData == null) return EmptySlot();

    return ARSDragTarget<ScenarioItem>(
      child: EmptySlot(),
      acceptedData: onAcceptedData,
    );
  }
}

class ARSGridImageItem extends StatelessWidget {
  final ScenarioItem item;
  final bool selected;
  final Function(BuildContext, ScenarioItem) onItemClicked;
  final double itemSize;
  final bool draggable;

  const ARSGridImageItem(
      {Key key, @required this.item, this.selected = false, this.onItemClicked, this.itemSize = ITEM_SIZE, this.draggable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = createContent(context);

    if(draggable) {
      content = Draggable<ScenarioItem>(
        childWhenDragging: EmptySlot(),
        data: item,
        feedback: SizedBox(height: itemSize, width: itemSize, child: imageSlot),
        child: content,
      );
    }

    // If not selected, we add padding, so selected item will appear bigger than non-selected
    final hPadding = (this.selected) ? 8.0 : 12.0;
    final vPadding = (this.selected) ? 0.0 : 4.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
      child: content,
    );
  }

  Widget createContent(BuildContext context) => AspectRatio(
        aspectRatio: 1,
        child: (onItemClicked == null)
            ? imageSlot
            : InkWell(
                onTap: () => onItemClicked(context, item),
                child: imageSlot),
      );

  Widget get imageSlot => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage(item.image), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(6),
        ),
      );
}

class EmptySlot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(6)),
    );
  }
}
