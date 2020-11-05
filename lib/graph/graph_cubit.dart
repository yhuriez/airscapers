

import 'package:cubit/cubit.dart';
import 'package:flutter/material.dart';

import '../injection.dart';
import 'graph_node.dart';
import 'graph_use_case.dart';

class GraphCubit extends Cubit<GraphModel> {

  GraphCubit() : super(GraphModel({}, []));

  init(BuildContext context) async {
    final createTreeUseCase = sl<CreateItemTreeUseCase>();
    final graph = await createTreeUseCase.execute(context);
    emit(graph);
  }
}

