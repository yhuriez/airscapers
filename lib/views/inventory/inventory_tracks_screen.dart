import 'package:airscaper/model/entities/element_description.dart';
import 'package:airscaper/model/entities/scenario_track.dart';
import 'package:airscaper/usecases/inventory_use_cases.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';
import 'inventory_details_screen.dart';

class InventoryTracksScreen extends StatelessWidget {

  static const routeName = "/tracks";
  
  final loadTrackUseCase = sl<LoadTracksUseCase>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text("Pistes"),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true),
      body: FutureBuilder<List<ScenarioTrack>>(
        future: loadTrackUseCase.execute(),
        builder: (context, snapshot) {
          final tracks = snapshot.data ?? [];
          return createItemGrid(context, tracks);
        }
      ),
    );
  }

  Widget createItemGrid(BuildContext context, List<ScenarioTrack> tracks) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
              tracks.map((it) => createItem(context, it)).toList()),
        )
      ],
    );
  }

  Widget createItem(BuildContext context, ScenarioTrack track) {
    return InkWell(
      onTap: (){
        final desc = ScenarioElementDesc.fromTrack(track, found: true);
        Navigator.of(context).pushNamed(InventoryDetailsFragment.routeName, arguments: desc);
      },
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            (track.image == null) ? Container() : Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 100,
                  child: Image.asset(track.image)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(track.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
