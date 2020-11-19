


import 'package:airscaper/builder/domain/blocs/session_cubit.dart';
import 'package:airscaper/builder/views/login/login_screen.dart';
import 'package:airscaper/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

class LoggedScreen extends StatelessWidget {

  final WidgetBuilder builder;

  const LoggedScreen({Key key, @required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CubitBuilder<SessionCubit, SessionState>(builder: (context, state){
      if (state.loading) return loadingView;
      if (!state.connected) {
        // Goes to login screen
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushNamed(LoginScreen.screenName);
        });

        return Container();
      }
      return builder(context);
    });
  }


  Widget get loadingView => Center(child: SizedBox(
    width: 100,
    height: 100,
    child: CircularProgressIndicator(
      strokeWidth: 10,
      valueColor: AlwaysStoppedAnimation(arsAccentColor),
    ),
  ),);
}