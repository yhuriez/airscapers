import 'package:airscaper/common/extensions/list_extensions.dart';
import 'package:airscaper/models/scenario_item.dart';
import 'package:airscaper/views/common/ars_drag_target.dart';
import 'package:airscaper/views/common/ars_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/arrow_page_indicator.dart';

const int GRID_ITEM_PER_PAGE = 4;
const double GRID_HEIGHT = 60;
const double ITEM_SIZE = 50;

class ARSPaginatedGrid extends StatelessWidget {
  final List<ScenarioItem> items;
  final String? selectedItem;
  final String? newItem;
  final Function(BuildContext, ScenarioItem, bool) onItemClicked;

  // pageNotifier is external because we want to keep selected page index across widget update
  final ValueNotifier<int> pageNotifier;

  ARSPaginatedGrid(
      {Key? key,
      required this.items,
        required this.selectedItem,
        required this.onItemClicked,
        required this.pageNotifier,
        this.newItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = _computePages(context);

    // Compute initial page (if we must show a new item, redirect to last page)
    var initialPage = pageNotifier.value;
    if (newItem != null) {
      initialPage = pages.length - 1;
      pageNotifier.value = initialPage;
    }

    final controller = PageController(initialPage: initialPage);

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

  List<List<Widget>> _computePages(BuildContext context) {
    var missingItems = 0;
    final modulo = items.length % GRID_ITEM_PER_PAGE;

    if(items.length == 0) {
      missingItems = GRID_ITEM_PER_PAGE;
    } else if(modulo > 0) {
      missingItems = GRID_ITEM_PER_PAGE - modulo;
    }

    final imageItems = items
        .map((item) => ARSGridImageItem(
            item: item,
            selected: item.id == selectedItem,
            animated: newItem != null && newItem == item.id,
            onItemClicked: onItemClicked))
        .toList();

    final emptyItems =
        List.generate(missingItems, (index) => ARSGridEmptyItem());

    final List<Widget> allItems = ([...imageItems, ...emptyItems]).toList();

    return allItems.partition(GRID_ITEM_PER_PAGE).toList();
  }
}

class ARSGridPage extends StatelessWidget {
  final List<Widget> children;

  const ARSGridPage({Key? key, required this.children}) : super(key: key);

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
  final OnAcceptedData<ScenarioItem>? onAcceptedData;

  const ARSGridEmptyItem({Key? key, this.onAcceptedData}) : super(key: key);

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
      targetBuilder: (context, incoming, rejected) => EmptySlot(),
      acceptedData: onAcceptedData,
    );
  }
}

class ARSGridImageItem extends StatelessWidget {
  final ScenarioItem item;
  final bool selected;
  final Function(BuildContext, ScenarioItem, bool) ?onItemClicked;
  final double itemSize;
  final bool draggable;
  final bool animated;

  const ARSGridImageItem(
      {Key? key,
      required this.item,
      this.selected = false,
      this.onItemClicked,
      this.itemSize = ITEM_SIZE,
      this.animated = false,
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

    content = Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
      child: content,
    );

    if (animated) {
      content = ARSScaleAnimation(
        child: content,
      );
    }

    return content;
  }

  Widget createContent(BuildContext context) => AspectRatio(
        aspectRatio: 1,
        child: (onItemClicked == null)
            ? imageSlot
            : InkWell(
                onTap: () => onItemClicked?.call(context, item, selected),
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
