

import 'package:cubit/cubit.dart';
import 'package:flutter/material.dart';


import 'graph_node.dart';
import 'graph_use_case.dart';

class GraphCubit extends Cubit<GraphModel> {

  GraphCubit() : super(GraphModel({}, []));

  init(BuildContext context) async {
    final createTreeUseCase = CreateItemTreeUseCase();
    final graph = await createTreeUseCase.execute(context);
    emit(graph);
  }

  updateMode(GraphMode mode) {
    emit(GraphModel(state.nodes, state.edges, graphMode: mode));
  }
}

