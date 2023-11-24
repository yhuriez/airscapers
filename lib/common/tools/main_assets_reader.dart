
import 'package:airscaper/common/tools/abs_assets_reader.dart';
import 'package:flutter/services.dart';

class MainAssetsReader extends AbsAssetsReader{

  Future<String> readAssetFile(String filename) async {
    return rootBundle.loadString("assets/$filename");
  }
}