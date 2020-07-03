import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';

const GRID_ITEM_PER_PAGE = 5;
const double GRID_HEIGHT = 60;

class ARSGrid extends StatelessWidget {

  final List<ScenarioItem> items;
  final _controller = PageController();

  ARSGrid({Key key, this.items}) : super(key: key);

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

    final imageItems =
        items.map((item) => ARSGridImageItem(item: item)).toList();
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
    return Container(color: Colors.black, child: Row(children: children, mainAxisAlignment: MainAxisAlignment.spaceBetween,));
  }
}

class ARSGridEmptyItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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

  const ARSGridImageItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(item.image, fit: BoxFit.fill,),
          ),
        ),
      ),
    );
  }
}
