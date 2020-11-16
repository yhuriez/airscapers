


import 'package:airscaper/app/app.dart';
import 'package:airscaper/builder/app.dart';

const bool launchBuilder = true;
// const bool launchBuilder = false;

Future<void> main() async {
  if(launchBuilder) {
    initBuilder();
  } else {
    initApp();
  }
}
