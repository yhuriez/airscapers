


import 'package:airscaper/builder/model/scenario.dart';
import 'package:cubit/cubit.dart';

class HomeCubit extends Cubit<HomeState> {

  HomeCubit() : super(HomeState(loading: true));

  init() async {

  }
}

class HomeState {
  final bool loading;
  final List<Scenario> scenarios;

  HomeState({this.loading, this.scenarios});
}