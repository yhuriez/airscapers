import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/views/common/ars_drag_target.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/arrow_page_indicator.dart';
import 'package:quiver/iterables.dart';

const int GRID_ITEM_PER_PAGE = 4;
const double GRID_HEIGHT = 60;
const double ITEM_SIZE = 50;

class ARSPaginatedGrid extends StatelessWidget {
  final List<ScenarioItem> items;
  final int selectedItem;
  final Function(BuildContext, ScenarioItem, bool) onItemClicked;

  // pageNotifier is external because we want to keep selected page index across widget update
  final ValueNotifier pageNotifier;

  ARSPaginatedGrid(
      {Key key,
      this.items,
      this.selectedItem,
      this.onItemClicked,
      this.pageNotifier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = computePages(context);

    final controller = PageController(initialPage: pageNotifier.value);

    return SizedBox(
      height: GRID_HEIGHT,
      child: ArrowPageIndicator(
        key: LabeledGlobalKey("arrow_grid_${pages.length}"),
        pageController: controller,
        itemCount: pages.length,
        leftIcon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 32.0,
        ),
        rightIcon:
            Icon(Icons.arrow_forward_ios, color: Colors.white, size: 32.0),
        currentPageNotifier: pageNotifier,
        child: PageView.builder(
          controller: controller,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return ARSGridPage(children: pages[index]);
          },
          onPageChanged: (index) {
            pageNotifier.value = index;
          },
        ),
      ),
    );
  }

  List<List<Widget>> computePages(BuildContext context) {
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
          children: children.map((item) => Expanded(child: item)).toList(),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ));
  }
}

class ARSGridEmptyItem extends StatelessWidget {
  final OnAcceptedData<ScenarioItem> onAcceptedData;

  const ARSGridEmptyItem({Key key, this.onAcceptedData}) : super(key: key);

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
  final Function(BuildContext, ScenarioItem, bool) onItemClicked;
  final double itemSize;
  final bool draggable;

  const ARSGridImageItem(
      {Key key,
      @required this.item,
      this.selected = false,
      this.onItemClicked,
      this.itemSize = ITEM_SIZE,
      this.draggable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = createContent(context);

    if (draggable) {
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
                onTap: () => onItemClicked(context, item, selected), child: imageSlot),
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
