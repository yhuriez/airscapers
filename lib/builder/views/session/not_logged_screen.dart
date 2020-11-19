


import 'package:airscaper/builder/domain/blocs/session_cubit.dart';
import 'package:airscaper/builder/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

class NotLoggedScreen extends StatelessWidget {

  final WidgetBuilder builder;

  const NotLoggedScreen({Key key, @required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CubitBuilder<SessionCubit, SessionState>(builder: (context, state){
      if (state.loading) return Container();
      if (state.connected) {
        // Goes to home screen
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushNamed(HomeScreen.screenName);
        });

        return Container();
      }
      return builder(context);
    });
  }
}